import 'package:flutter/material.dart';
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
      formatButtonVisible: false,
    );
  }
}
