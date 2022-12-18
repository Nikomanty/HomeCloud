import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';

class CalendarService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<List<CalendarEventModel>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _database
        .collection("calendar-events")
        .orderBy('eventDate', descending: false)
        .get();
    return snapshot.docs
        .map((documentSnapshot) =>
            CalendarEventModel.fromDocument(documentSnapshot))
        .toList();
  }
}
