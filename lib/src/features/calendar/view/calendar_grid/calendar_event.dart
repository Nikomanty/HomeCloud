import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/styles.dart';
import 'package:home_cloud/src/core/utils/date_formatters.dart';

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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: eventColor,
        borderRadius: Styles.smallRoundedCorner,
        border: Border.all(color: Colors.black54),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                eventTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black),
              ),
            ),
            if (eventTime != null)
              Text(
                DateFormatters.formattedTimeHHmm(eventTime!),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
