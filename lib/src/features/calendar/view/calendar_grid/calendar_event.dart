import 'package:flutter/material.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';

class CalendarEvent extends StatelessWidget {
  final String eventTitle;
  final DateTime? eventTime;
  final Color? eventColor;

  const CalendarEvent({
    super.key,
    required this.eventTitle,
    this.eventTime,
    this.eventColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: eventColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.black54),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                eventTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            if (eventTime != null)
              Text(
                DateFormatUtils.formattedTimeHHmm(eventTime!),
                style: const TextStyle(fontSize: 10),
              ),
          ],
        ),
      ),
    );
  }
}