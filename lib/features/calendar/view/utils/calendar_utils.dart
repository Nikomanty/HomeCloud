import 'package:flutter/material.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarUtils {
  static List<String> eventOwners() {
    return [
      "Niko",
      "Minna",
      "Melina",
      "Rasmus",
      "Yhteinen",
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

  static List<CalendarEvent> getAllEventsByDate(
      List<CalendarEvent> allEvents, DateTime date) {
    List<CalendarEvent> eventsForGivenDate = [];
    for (var element in allEvents) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      if (dateFormat.format(element.eventDate) == dateFormat.format(date)) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }
}
