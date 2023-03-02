import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/app_colors.dart';
import 'package:home_cloud/src/extensions/strings_extension.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_grid/calendar_event.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBuilderHelper {
  static CalendarBuilders getHomeCalendarBuilder() {
    return CalendarBuilders(
      defaultBuilder: (context, day, focusedDay) =>
          _dateDayText(context, "${day.day}", AppColors.onPrimary),
      selectedBuilder: (context, day, selectedDay) =>
          _currentAndSelectedDayBuilder(
              context, selectedDay, AppColors.secondary),
      todayBuilder: (context, currentDay, selectedDay) =>
          _currentAndSelectedDayBuilder(
              context, currentDay, AppColors.secondary.withOpacity(0.8)),
      outsideBuilder: (context, currentDay, selectedDay) =>
          _offMonthDays(context, currentDay),
      markerBuilder: (context, date, eventList) =>
          _markerBuilder(context, eventList),
      headerTitleBuilder: (context, time) => _headerTitle(context, time),
    );
  }

  static Widget _headerTitle(BuildContext context, DateTime time) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "${DateFormat('MMMM', 'fi').format(time)} / ${time.year}"
            .capitalizeString(),
        style: Theme.of(context).textTheme.headlineSmall,
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
    for (var item in list) {
      int index = list.indexOf(item);
      widgets.add(CalendarEvent(
        eventTitle: list[index].eventTitle as String,
        eventTime: list[index].eventTime as DateTime?,
        eventColor: list[index].eventColor as Color?,
      ));
      //Break loop if more than 2 items to not overflow calendar date
      if (index >= 1) break;
    }
    if (list.length > 2) {
      widgets.add(CalendarEvent(
        eventTitle: CalendarStrings.getMoreEventString(list.length - 2),
        eventColor: Colors.white,
      ));
    }
    return widgets;
  }

  static Widget _currentAndSelectedDayBuilder(
      BuildContext context, DateTime day, Color highLightColor) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: Utils.getTextSize(
            day.day.toString(),
            const TextStyle(fontSize: 18),
          ).height,
          decoration: BoxDecoration(
            color: highLightColor,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
      ),
      _dateDayText(context, "${day.day}", AppColors.onSecondary),
    ]);
  }

  static Widget _offMonthDays(BuildContext context, DateTime day) {
    return ColoredBox(
      color: AppColors.primary,
      child: _dateDayText(context, "${day.day}", AppColors.onPrimary),
    );
  }

  static Widget _dateDayText(
      BuildContext context, String dayText, Color dayTextColor) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          dayText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: dayTextColor),
        ),
      ),
    );
  }
}
