import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';

class CalendarService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collectionPath = "calendar-events";

  Future<List<CalendarEventModel>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _database.collection(collectionPath).get();
    return snapshot.docs
        .map((documentSnapshot) =>
            CalendarEventModel.fromDocument(documentSnapshot))
        .toList();
  }

  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  ) async {
    await _database
        .collection(collectionPath)
        .doc(documentID)
        .set(newDocumentObject);
  }

  Future<void> deleteData(String documentId) async {
    await _database.collection(collectionPath).doc(documentId).delete();
  }
}
