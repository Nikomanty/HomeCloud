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

  static Map<DateTime, String> allNameDays(int currentYear) {
    return {
      DateTime.utc(currentYear, 1, 17): "Toni",
      DateTime.utc(currentYear, 3, 4): "Ari",
      DateTime.utc(currentYear, 5, 2): "Vuokko",
      DateTime.utc(currentYear, 5, 5): "Melina",
      DateTime.utc(currentYear, 5, 21): "Konsta",
      DateTime.utc(currentYear, 5, 26): "Minna",
      DateTime.utc(currentYear, 6, 24): "Juho",
      DateTime.utc(currentYear, 6, 26): "Janne",
      DateTime.utc(currentYear, 6, 29): "Petri",
      DateTime.utc(currentYear, 7, 1): "Aaro",
      DateTime.utc(currentYear, 7, 19): "Sari",
      DateTime.utc(currentYear, 7, 21): "Hanne, Jonna",
      DateTime.utc(currentYear, 7, 25): "Jimi",
      DateTime.utc(currentYear, 8, 11): "Sanna",
      DateTime.utc(currentYear, 9, 14): "Iida",
      DateTime.utc(currentYear, 10, 6): "Pinja",
      DateTime.utc(currentYear, 10, 10): "Rasmus",
      DateTime.utc(currentYear, 10, 24): "Rasmus",
      DateTime.utc(currentYear, 10, 22): "Anita",
      DateTime.utc(currentYear, 12, 6): "Niko",
      DateTime.utc(currentYear, 12, 8): "Kyllikki",
      DateTime.utc(currentYear, 12, 9): "Anne",
      DateTime.utc(currentYear, 12, 11): "Tatu",
      DateTime.utc(currentYear, 12, 27): "Hannu",
    };
  }
}
