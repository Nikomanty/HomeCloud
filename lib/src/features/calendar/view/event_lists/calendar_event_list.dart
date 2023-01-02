import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/event_lists/calendar_event_list_item.dart';
import 'package:home_cloud/src/features/calendar/view/res/calendar_strings.dart';

class CalendarEventList extends StatefulWidget {
  final String title;
  final List<CalendarEventModel> eventsList;

  const CalendarEventList({
    Key? key,
    required this.title,
    required this.eventsList,
  }) : super(key: key);

  @override
  State<CalendarEventList> createState() => _CalendarEventListState();
}

class _CalendarEventListState extends State<CalendarEventList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(width: 0.8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2.0, right: 2.0),
              child: _eventsList(),
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Text(widget.title),
            ),
          ),
        ],
      ),
    );
  }

  _eventsList() {
    if (widget.eventsList.isNotEmpty) {
      return ListView(
        children:
        widget.eventsList.map((CalendarEventModel eventItemModel) {
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