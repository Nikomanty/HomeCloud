import 'package:flutter/material.dart';
import 'package:home_cloud/src/extensions/strings_extension.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_grid/calendar_event.dart';
import 'package:home_cloud/src/features/calendar/view/res/calendar_strings.dart';
import 'package:home_cloud/src/utils/text_utils.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBuilderHelper {
  static CalendarBuilders getHomeCalendarBuilder() {
    return CalendarBuilders(
      defaultBuilder: (context, day, focusedDay) =>
          _defaultCalendarBuilder(day),
      selectedBuilder: (context, day, selectedDay) =>
          _currentAndSelectedDayBuilder(selectedDay, Colors.purple.shade400),
      todayBuilder: (context, currentDay, selectedDay) =>
          _currentAndSelectedDayBuilder(currentDay, Colors.purple.shade200),
      outsideBuilder: (context, currentDay, selectedDay) =>
          _offMonthDays(currentDay),
      markerBuilder: (context, date, eventList) =>
          _markerBuilder(context, eventList),
      headerTitleBuilder: (context, time) => _headerTitle(time),
    );
  }

  static Widget _headerTitle(DateTime time) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "${DateFormat('MMMM', 'fi').format(time)} / ${time.year}"
            .capitalizeString(),
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  static Widget? _markerBuilder(BuildContext context, List<dynamic> eventList) {
    if (eventList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: _eventWidgetList(eventList),
        ),
      );
    }
    return null;
  }

  static List<Widget> _eventWidgetList(List<dynamic> list) {
    List<Widget> widgets = [];
    for (int i = 0; i < list.length; i++) {
      widgets.add(CalendarEvent(
        eventTitle: list[i].eventTitle,
        eventTime: list[i].eventTime,
        eventColor: list[i].eventColor,
      ));
      if (i >= 1) {
        break;
      }
    }
    if (list.length > 2) {
      widgets.add(CalendarEvent(
        eventTitle: CalendarStrings.getMoreEventString(list.length - 2),
      ));
    }
    return widgets;
  }

  static Widget _defaultCalendarBuilder(DateTime day) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text("${day.day}"),
      ),
    );
  }

  static Widget _currentAndSelectedDayBuilder(
      DateTime day, Color highLightColor) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: TextUtils.getTextSize(
            day.day.toString(),
            const TextStyle(fontSize: 16),
          ).height,
          decoration: BoxDecoration(
            color: highLightColor,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "${day.day}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]);
  }

  static Widget _offMonthDays(DateTime day) {
    return Container(
      color: Colors.grey.shade300,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(day.day.toString()),
        ),
      ),
    );
  }
}