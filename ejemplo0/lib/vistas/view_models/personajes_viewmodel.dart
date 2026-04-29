import 'package:ejemplo0/data/repositorios/personaje_repo.dart';
import 'package:ejemplo0/modelo/personaje.dart';
import 'package:flutter/material.dart';

class PersonajesViewModel extends ChangeNotifier {
  final PersonajeRepo _repo = PersonajeRepo();

  List<PersonajeFavorito> _personajes = [];
  bool _isLoading = false;

  List<PersonajeFavorito> get listaPersonajes => _personajes;
  bool get isLoading => _isLoading;

  PersonajesViewModel() {
    fetchPersonajes();
  }

  void fetchPersonajes() {
    _isLoading = true;
    notifyListeners();

    _repo.getPersonajes().listen((personajeList) {
      _personajes = personajeList;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> agregar() async {
    try {
      // El ID lo genera automáticamente Firebase al insertar
      final nuevo = PersonajeFavorito(
        id: '',
        nombre: "Kiko",
        serie: "Chavo",
        imagen: "",
      );
      await _repo.addPersonaje(nuevo);
    } catch (e) {
      //state = AsyncValue.error(e, st);
    }
  }
}
