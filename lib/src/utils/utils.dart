import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/app_colors.dart';

class Utils {
  static void showNotificationSnack({
    required BuildContext context,
    required String notificationString,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          notificationString,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  static Size getTextSize(String text, TextStyle textStyle) {
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return painter.size;
  }
}
