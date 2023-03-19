import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarUtils {
  static List<Color> availableItemColors() {
    return [
      Colors.white,
      Colors.green,
      Colors.red.shade300,
      Colors.orange.shade300,
    ];
  }

  static HeaderStyle getCalendarHeaderStyle(BuildContext context) {
    return HeaderStyle(
      titleTextStyle:
          Theme.of(context).textTheme.headlineSmall ?? const TextStyle(),
      titleCentered: true,
      leftChevronIcon: const Icon(Icons.arrow_circle_left_outlined),
      rightChevronIcon: const Icon(Icons.arrow_circle_right_outlined),
      headerPadding: const EdgeInsets.all(0),
      formatButtonVisible: false,
    );
  }

  static List<CalendarEventModel> getAllEventsByDate(
      List<CalendarEventModel> allEvents, DateTime date) {
    List<CalendarEventModel> eventsForGivenDate = [];
    for (var element in allEvents) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      if (dateFormat.format(element.eventDate) == dateFormat.format(date)) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }
}
