import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';

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

  static bool isViewLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double getViewHeight(BuildContext context) {
    return MediaQuery.of(context).size.height - window.viewPadding.top;
  }
}
