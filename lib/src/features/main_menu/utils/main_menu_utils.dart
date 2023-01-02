import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_grid/calendar_view.dart';
import 'package:home_cloud/src/features/todo/view/todo_view.dart';

/// All static variables/getters used in Home Cloud application
class MainMenuUtils {
  //TODO: Change to real views
  static List<Widget> homeCloudViews = [
    const CalendarView(),
    const TodoView(),
  ];

  //TODO: Change to real view names
  static IconData getItemIcon(String viewName) {
    switch (viewName) {
      case "CalendarView":
        return Icons.calendar_today_outlined;
      case "TodoView":
        return Icons.list_alt_outlined;
      default:
        return Icons.not_interested_sharp;
    }
  }
}