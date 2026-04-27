import 'package:ejemplo0/vistas/counter_screen.dart';
import 'package:ejemplo0/vistas/view_models/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: MaterialApp(home: CounterScreen()),
    ),
  );
}
