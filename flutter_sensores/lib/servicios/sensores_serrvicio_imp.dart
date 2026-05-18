import 'package:flutter_sensores/servicios/sensores_servicio.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsPlusService implements ISensorsService {
  @override
  Stream<dynamic> getAccelerometerStream() => accelerometerEventStream();

  @override
  Stream<dynamic> getGyroscopeStream() => gyroscopeEventStream();

  @override
  Stream<dynamic> getMagnetometerStream() => magnetometerEventStream();

  @override
  Stream<dynamic> getBarometerStream() => barometerEventStream();
}
