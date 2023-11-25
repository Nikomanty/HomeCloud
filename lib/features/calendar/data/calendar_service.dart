import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';

class CalendarService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collectionPath = "calendar-events";

  Future<List<CalendarEvent>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _database.collection(collectionPath).get();
    return snapshot.docs
        .map((documentSnapshot) => CalendarEvent.fromMap(
              documentSnapshot.id,
              documentSnapshot.data(),
            ))
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
