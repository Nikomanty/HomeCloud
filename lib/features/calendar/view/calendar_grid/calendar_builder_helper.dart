import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/core/extensions/strings_extension.dart';
import 'package:home_cloud/core/utils/utils.dart';
import 'package:home_cloud/features/calendar/models/holiday.dart';
import 'package:home_cloud/features/calendar/view/calendar_grid/calendar_event.dart';
import 'package:home_cloud/features/calendar/view/calendar_grid/flag_day_info_button.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_utils.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBuilderHelper {
  static CalendarBuilders getHomeCalendarBuilder() {
    return CalendarBuilders(
      defaultBuilder: (context, day, focusedDay) =>
          _dateDayText(context, day, AppColors.onPrimary),
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
      weekNumberBuilder: (context, weekNumber) =>
          _weekNumberBuilder(context, weekNumber),
    );
  }

  static Widget _weekNumberBuilder(BuildContext context, int weekNumber) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Text("$weekNumber", style: Theme.of(context).textTheme.bodySmall),
    ));
  }

  static Widget _headerTitle(BuildContext context, DateTime time) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "${DateFormat('MMMM', 'fi').format(time)} / ${time.year}"
            .capitalizeString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  static Widget? _markerBuilder(BuildContext context, List<dynamic> eventList) {
    if (eventList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: _eventWidgetList(context, eventList),
        ),
      );
    }
    return null;
  }

  static List<Widget> _eventWidgetList(
      BuildContext context, List<dynamic> list) {
    List<Widget> widgets = [];
    int maxEvents = Utils.isViewLandscape(context) ? 3 : 2;
    for (var item in list) {
      int index = list.indexOf(item);
      widgets.add(CalendarEvent(
        eventTitle: list[index].eventTitle as String,
        eventTime: list[index].eventTime as DateTime?,
        eventColor: list[index].eventColor as Color?,
      ));
      //Break loop if more than 2 items to not overflow calendar date
      if (widgets.length >= maxEvents) break;
    }
    if (list.length > maxEvents) {
      widgets.last = CalendarEvent(
        eventTitle: CalendarStrings.getMoreEventString(
            list.length - widgets.length + 1),
        eventColor: Colors.white,
      );
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
      _dateDayText(context, day, AppColors.onSecondary),
    ]);
  }

  static Widget _offMonthDays(BuildContext context, DateTime day) {
    return ColoredBox(
      color: AppColors.primary,
      child: _dateDayText(context, day, AppColors.onPrimary),
    );
  }

  static Widget _dateDayText(
      BuildContext context, DateTime dateTime, Color dayTextColor) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "${dateTime.day}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: dayTextColor),
                ),
                const SizedBox(height: 2),
                if (_hasNameDay(dateTime))
                  Text(
                    CalendarUtils.allNameDays(dateTime.year)
                        .entries
                        .firstWhere((element) => element.key == dateTime)
                        .value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
        if (CalendarUtils.allFlagAndHolidays(dateTime.year)
            .any((element) => element.dateTime == dateTime))
          _flagDays(dateTime),
      ],
    );
  }

  static Widget _flagDays(DateTime dateTime) {
    Holiday holiday = CalendarUtils.allFlagAndHolidays(dateTime.year)
        .firstWhere((element) => element.dateTime == dateTime);
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FlagDayInfoButton(
          title: holiday.title,
          isFlagDay: holiday.isFlagDay,
        ),
      ),
    );
  }

  static bool _hasNameDay(DateTime dateTime) {
    return CalendarUtils.allNameDays(dateTime.year)
        .entries
        .any((element) => element.key == dateTime);
  }
}
