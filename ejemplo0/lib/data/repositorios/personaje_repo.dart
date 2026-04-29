import 'package:ejemplo0/data/datasourses/realdatabase_firebase_service.dart';
import 'package:ejemplo0/modelo/personaje.dart';

class PersonajeRepo {
  final DatosFBrealDBService _serviceFB = DatosFBrealDBService(
    databaseName: "personajes",
  );

  // 1. CREAR (Create)
  Future<void> addPersonaje(PersonajeFavorito pf) async {
    await _serviceFB.guardarConIdAutogenerado(pf);
  }

  // 2. LEER (Read) - Stream en tiempo real
  Stream<List<PersonajeFavorito>> getPersonajes() {
    return _serviceFB.consultarPesonajes();
  }

  /*
  // 3. ACTUALIZAR (Update)
  Future<void> updateProduct(ProductModel product) async {
    await _firestore
        .collection(_collectionPath)
        .doc(product.id)
        .update(product.toFirestore());
  }

  // 4. BORRAR (Delete)
  Future<void> deleteProduct(String id) async {
    await _firestore.collection(_collectionPath).doc(id).delete();
  }
  */
}
