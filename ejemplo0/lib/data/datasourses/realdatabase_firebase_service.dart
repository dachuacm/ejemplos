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
    final snapshot = dbRef.get();

    /*   return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((e) => Task.fromMap(e.value, e.key)).toList();
    }); */

    return snapshot.asStream().map((snapshot) {
      return snapshot.children
          .map((doc) => PersonajeFavorito.fromMap(doc))
          .toList();
    });

    /*

    if (snapshot.exists) {
      // snapshot.children contiene la lista ordenada de nodos hijos
      for (final child in snapshot.children) {
        final data = child.value as Map<dynamic, dynamic>;

        // Creamos el objeto y lo añadimos a nuestra lista
        listaPersonajes.add(PersonajeFavorito.fromMap(data));
      }
    }
    return listaPersonajes;
  */
  }
}
