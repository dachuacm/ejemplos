import 'package:ejemplo0/servicios/auth_servicio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService(); // Inyección del servicio

  User? _currentUser;
  User? get currentUser => _currentUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> registro(
    String email,
    String password,
    BuildContext context,
  ) async {
    _setLoading(true);
    try {
      await _authService.registerWithEmail(email, password);
      _setLoading(false);
      return true;
    } catch (e) {
      _setLoading(false);
      _showError(context, e.toString());
      return false;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void validaUsuario(String email, String password) {
    _authService.login(email, password).asStream().listen((user) {
      _currentUser = user;
    });
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void cerrarSesion() {
    _authService.signOut();
  }
}
