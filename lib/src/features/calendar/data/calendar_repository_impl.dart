import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';

import 'calendar_service.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final CalendarService _calendarService = CalendarService();

  @override
  Future<List<CalendarEventModel>> fetchData() {
    return _calendarService.fetchData();
  }

  @override
  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  ) {
    return _calendarService.createData(documentID, newDocumentObject);
  }

  @override
  Future<void> deleteData(String documentId) {
    return _calendarService.deleteData(documentId);
  }
}

abstract class CalendarRepository {
  Future<List<CalendarEventModel>> fetchData();
  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  );
  Future<void> deleteData(String documentId);
}
