import 'package:flutter/material.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:home_cloud/features/calendar/view/event_lists/calendar_event_list_item.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/widgets/containers/titleable_outline_box.dart';

class CalendarEventList extends StatelessWidget {
  final List<CalendarEvent> eventsList;

  const CalendarEventList({
    super.key,
    required this.eventsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: TitleableOutlineBox(
          title: CalendarStrings.selectedDayCalendarEvents,
          content: _eventsList(context),
        ));
  }

  Widget _eventsList(BuildContext context) {
    return ListView(
      children: eventsList.map((eventItemModel) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CalendarEventListItem(
            eventItemModel: eventItemModel,
          ),
        );
      }).toList(),
    );
  }
}
