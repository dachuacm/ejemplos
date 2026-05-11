import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Retorna el usuario si tiene éxito, o lanza una excepción si falla
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Aquí podrías mapear errores de Firebase a errores personalizados
      throw e.message ?? "Error desconocido";
    }
  }

  //incio de sesión
  Future<User?> login(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //cerrar cesión
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
