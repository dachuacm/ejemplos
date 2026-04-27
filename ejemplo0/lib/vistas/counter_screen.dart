import 'package:ejemplo0/vistas/view_models/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Escucha cambios en el viewModel
    final viewModel = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("MVVM + Provider")),
      body: Center(
        child: Text('${viewModel.counter}', style: TextStyle(fontSize: 40)),
      ),
      floatingActionButton: FloatingActionButton(
        // Llama a la lógica sin conocer detalles internos
        onPressed: () => viewModel.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
