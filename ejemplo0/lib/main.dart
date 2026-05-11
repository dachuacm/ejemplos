import 'package:ejemplo0/firebase_options.dart';
import 'package:ejemplo0/vistas/myapp.dart';
import 'package:ejemplo0/vistas/view_models/auth_viewmodel.dart';
import 'package:ejemplo0/vistas/view_models/personajes_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonajesViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
