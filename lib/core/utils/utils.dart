import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';

class Utils {
  static void showNotificationSnack({
    required BuildContext context,
    required String notificationString,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          notificationString,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.onSecondary),
        ),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: MediaQuery.of(context).size.width / 4,
          right: MediaQuery.of(context).size.width / 4,
        ),
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
