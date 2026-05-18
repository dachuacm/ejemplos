import 'package:flutter/material.dart';
import 'package:flutter_sensores/servicios/sensores_serrvicio_imp.dart';
import 'package:flutter_sensores/servicios/sensores_servicio.dart';
import 'package:flutter_sensores/vista/view_model/sensores_viewmodel.dart';
import 'package:flutter_sensores/vista/vista_sensores.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 1. Instanciamos el servicio utilizando la interfaz definida
        Provider<ISensorsService>(create: (_) => SensorsPlusService()),

        // 2. Inyectamos el servicio al ViewModel
        ChangeNotifierProvider(
          create: (context) =>
              SensorsViewModel(sensorsService: context.read<ISensorsService>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SensorsView(), //Llamamos a la vista
    );
  }
}
