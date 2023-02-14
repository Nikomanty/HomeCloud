import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/event_lists/calendar_event_list_item.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/widgets/containers/titled_outline_box.dart';

class CalendarEventList extends StatelessWidget {
  final String title;
  final List<CalendarEventModel> eventsList;

  const CalendarEventList({
    super.key,
    required this.title,
    required this.eventsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TitledOutlineBox(
        title: title,
        content: _eventsList(context),
      )
    );
  }

  Widget _eventsList(BuildContext context) {
    if (eventsList.isNotEmpty) {
      return ListView(
        children:
        eventsList.map((eventItemModel) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: CalendarEventListItem(
              eventItemModel: eventItemModel,
            ),
          );
        }).toList(),
      );
    }
    return Center(
      child: Text(
        CalendarStrings.noEventsString,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}