import 'package:ejemplo0/modelo/personaje.dart';
import 'package:firebase_database/firebase_database.dart';

class DatosFBrealDBService {
  String databaseName;

  DatosFBrealDBService({required this.databaseName});
  final FirebaseDatabase _firedatabase = FirebaseDatabase.instance;

  Future<void> guardarConIdAutogenerado(PersonajeFavorito pf) async {
    DatabaseReference dbRef = _firedatabase.ref(databaseName).push();
    dbRef.set(pf.toFirestore());
  }

  Stream<List<PersonajeFavorito>> consultarPesonajes() {
    DatabaseReference dbRef = _firedatabase.ref(databaseName);
    return dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return [];

      return data.entries.map((entry) {
        // Usamos entry.key por si necesitas el ID de Firebase más adelante
        return PersonajeFavorito.fromMap(entry.value as Map<dynamic, dynamic>);
      }).toList();
    });
  }
}
