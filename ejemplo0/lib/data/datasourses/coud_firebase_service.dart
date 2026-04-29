import 'package:cloud_firestore/cloud_firestore.dart';

class DatosFBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDatosStream() {
    return _firestore.collection('personajes').snapshots();
  }

  Future<DocumentReference> createTask(Map<String, dynamic> data) {
    return _firestore.collection('personajes').add(data);
  }
}
