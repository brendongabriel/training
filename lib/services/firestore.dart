import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
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

  Stream<QuerySnapshot> getTrainingPerDay(DateTime? selectedDay) {
    DateTime now = DateTime.now();
    selectedDay ??= now;

    DateTime startOfDay =
        DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0, 0);
    DateTime endOfDay = DateTime(
        selectedDay.year, selectedDay.month, selectedDay.day, 23, 59, 59);

    Timestamp endOfDayTimestamp = Timestamp.fromDate(endOfDay);
    Timestamp startOfDayTimestamp = Timestamp.fromDate(startOfDay);

    return training.where('timestamp', isGreaterThanOrEqualTo: startOfDayTimestamp)
        .where('timestamp', isLessThanOrEqualTo: endOfDayTimestamp)
        .snapshots();
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
