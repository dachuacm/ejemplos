import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo0/modelo/personaje.dart';

class DatosFBService {
  String collectionName;

  DatosFBService({required this.collectionName});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<PersonajeFavorito>> getPersonajes() {
    return _firestore.collection(collectionName).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => PersonajeFavorito.fromFirestore(doc))
          .toList();
    });
  }

  Future<DocumentReference> createDatos(PersonajeFavorito personaje) {
    return _firestore.collection(collectionName).add(personaje.toFirestore());
  }
}
