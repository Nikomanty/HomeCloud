import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_view.dart';
import 'package:home_cloud/src/features/todo/view/todo_view.dart';

/// All static variables/getters used in Home Cloud application
class MainMenuUtils {
  static List<Widget> homeCloudViews = [
    const CalendarView(),
    const TodoView(),
  ];

  static IconData getItemIcon(String viewName) {
    switch (viewName) {
      case "CalendarView":
        return Icons.calendar_today;
      case "TodoView":
        return Icons.list_alt;
      default:
        return Icons.not_interested_sharp;
    }
  }
}