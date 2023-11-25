import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';

class FlagDayInfoButton extends StatelessWidget {
  final String title;
  final bool isFlagDay;

  const FlagDayInfoButton({
    super.key,
    required this.title,
    this.isFlagDay = false,
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
          child: Icon(
            isFlagDay ? Icons.flag : Icons.star,
            color: AppColors.secondary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
