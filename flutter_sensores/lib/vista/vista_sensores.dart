import 'package:flutter/material.dart';
import 'package:flutter_sensores/vista/view_model/sensores_viewmodel.dart';
import 'package:provider/provider.dart';

class SensorsView extends StatefulWidget {
  const SensorsView({super.key});

  @override
  State<SensorsView> createState() => _SensorsViewState();
}

class _SensorsViewState extends State<SensorsView> {
  @override
  void initState() {
    super.initState();
    // Ejecuta el escaneo inmediatamente al cargar la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SensorsViewModel>().checkSensors();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Escucha de forma activa los cambios del ViewModel
    final viewModel = context.watch<SensorsViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Escaner de Sensores (MVVM)')),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: viewModel.availableSensors.entries.map((entry) {
                return ListTile(
                  leading: Icon(
                    entry.value ? Icons.check_circle : Icons.cancel,
                    color: entry.value ? Colors.green : Colors.red,
                  ),
                  title: Text(entry.key),
                  subtitle: Text(
                    entry.value ? 'Hardware compatible' : 'No soportado',
                  ),
                );
              }).toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.checkSensors(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
