import 'package:ejemplo0/vistas/personaje_screen.dart';
import 'package:ejemplo0/vistas/view_models/personajes_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PersonajesViewModel(),
      child: MaterialApp(home: PersonajeScreen()),
    ),
  );
}
