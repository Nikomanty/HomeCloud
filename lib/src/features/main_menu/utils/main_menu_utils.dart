import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_event_placeholder_view.dart';

/// All static variables/getters used in Home Cloud application
class MainMenuUtils {
  //TODO: Change to real views
  static List<Widget> homeCloudViews = [
    const CalendarEventPlaceholderView(),
    Container(),
  ];

  //TODO: Change to real view names
  static IconData getItemIcon(String viewName) {
    switch (viewName) {
      case "CalendarEventPlaceholderView":
        return Icons.calendar_today_outlined;
      case "Container":
        return Icons.list_alt_outlined;
      default:
        return Icons.not_interested_sharp;
    }
  }
}