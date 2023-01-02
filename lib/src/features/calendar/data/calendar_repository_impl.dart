import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';

import 'calendar_service.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final CalendarService _calendarService = CalendarService();

  @override
  Future<List<CalendarEventModel>> fetchData() {
    return _calendarService.fetchData();
  }
}

abstract class CalendarRepository {
  Future<List<CalendarEventModel>> fetchData();
}