import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Styles {
  static HeaderStyle getCalendarHeaderStyle() {
    return const HeaderStyle(
      titleCentered: true,
      leftChevronIcon: Icon(Icons.arrow_circle_left_outlined),
      rightChevronIcon: Icon(Icons.arrow_circle_right_outlined),
      formatButtonVisible: false,
    );
  }

  static Widget smallDivider(bool vertical) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, top: 2.0, bottom: 2.0),
      child: Container(
        color: Colors.black,
        height: !vertical ? 1 : null,
        width: vertical ? 1 : null,
      ),
    );
  }

  static List<BoxShadow> itemShadow() {
    return [
      BoxShadow(
        color: Colors.grey.shade900,
        offset: const Offset(0.0, 1.0),
        blurRadius: 2.0,
      ),
    ];
  }

}