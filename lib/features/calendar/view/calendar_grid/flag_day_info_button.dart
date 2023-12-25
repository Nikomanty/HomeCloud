import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/features/calendar/models/dynamic_event.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_utils.dart';

class FlagDayInfoButton extends StatelessWidget {
  final String title;
  final DynamicEventType holidayType;
  final bool isFlagDay;

  const FlagDayInfoButton({
    super.key,
    required this.title,
    required this.holidayType,
    required this.isFlagDay,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      triggerMode: TooltipTriggerMode.tap,
      verticalOffset: -50,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: AppColors.primaryVariant,
          border: Border.all(color: AppColors.onPrimary),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: CalendarUtils.getHolidayIconByType(
          holidayType,
          isFlagDay,
        )),
      ),
    );
  }
}
