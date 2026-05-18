import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sensores/servicios/sensores_servicio.dart';

class SensorsViewModel extends ChangeNotifier {
  // Recibimos el servicio a través del constructor
  final ISensorsService _sensorsService;

  SensorsViewModel({required ISensorsService sensorsService})
    : _sensorsService = sensorsService;

  final Map<String, bool> _availableSensors = {
    'Acelerómetro': false,
    'Giroscopio': false,
    'Magnetómetro': false,
    'Barómetro': false,
  };

  bool _isLoading = true;
  final List<StreamSubscription> _subscriptions = [];

  Map<String, bool> get availableSensors => _availableSensors;
  bool get isLoading => _isLoading;

  void checkSensors() {
    _isLoading = true;
    notifyListeners();

    // Consumo directo de la capa de servicio
    _checkSensor(_sensorsService.getAccelerometerStream(), 'Acelerómetro');
    _checkSensor(_sensorsService.getGyroscopeStream(), 'Giroscopio');
    _checkSensor(_sensorsService.getMagnetometerStream(), 'Magnetómetro');
    _checkSensor(_sensorsService.getBarometerStream(), 'Barómetro');

    Timer(const Duration(milliseconds: 600), () {
      _isLoading = false;
      _cancelSubscriptions();
      notifyListeners();
    });
  }

  void _checkSensor(Stream stream, String sensorName) {
    final sub = stream.listen(
      (event) {
        if (!_availableSensors[sensorName]!) {
          _availableSensors[sensorName] = true;
          notifyListeners();
        }
      },
      onError: (error) {
        _availableSensors[sensorName] = false;
        notifyListeners();
      },
      cancelOnError: true,
    );
    _subscriptions.add(sub);
  }

  void _cancelSubscriptions() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();
  }

  @override
  void dispose() {
    _cancelSubscriptions();
    super.dispose();
  }
}
