import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class PersonajeFavorito {
  // 1. Atributos (campos)
  String id;
  String nombre;
  String serie;
  String? imagen;
  int nivelPoder;
  bool esProtagonista;

  // 2. Constructor
  PersonajeFavorito({
    required this.id,
    required this.nombre,
    required this.serie,
    required this.imagen,
    this.nivelPoder = 1,
    this.esProtagonista = false,
  });

  factory PersonajeFavorito.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return PersonajeFavorito(
      id: doc.id,
      nombre: data['nombre'] ?? '',
      serie: data['serie'] ?? '',
      imagen: data['imagen'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'nombre': nombre, 'serie': serie, 'imagen': imagen};
  }

  factory PersonajeFavorito.fromMap(Map<dynamic, dynamic> datos) {
    return PersonajeFavorito(
      id: "0",
      nombre: datos['nombre'] ?? '',
      serie: datos['serie'] ?? '',
      imagen: datos['imagen'],
    );
  }
}
