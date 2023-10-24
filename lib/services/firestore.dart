import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get colleciton of training
  final CollectionReference training =
      FirebaseFirestore.instance.collection('training');

  // CREATE
  Future<void> createTraining(String name, String description) {
    return training.add({
      'name': name,
      'description': description,
      'timestamp': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getTraining() {
    return training.orderBy('timestamp', descending: true).snapshots();
  }

  // UPDATE
  Future<void> updateTraining(String id, String name, String description) {
    return training.doc(id).update({
      'name': name,
      'description': description,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE
  Future<void> deleteTraining(String id) {
    return training.doc(id).delete();
  }
}
