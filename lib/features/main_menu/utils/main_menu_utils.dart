import 'package:flutter/material.dart';
import 'package:home_cloud/features/calendar/view/calendar_view.dart';
import 'package:home_cloud/features/todo/view/todo_view.dart';

/// All static variables/getters used in Home Cloud application
class MainMenuUtils {
  static const String calendarView = "CalendarView";
  static const String todoView = "TodoView";

  static List<String> homeCloudViews = [
    calendarView,
    todoView,
  ];

  static Widget getViewByName(String viewName) {
    switch (viewName) {
      case calendarView:
        return const CalendarView();
      case todoView:
        return const TodoView();
      default:
        throw UnimplementedError("No implementation for this view");
    }
  }

  static IconData getItemIconByName(String viewName) {
    switch (viewName) {
      case calendarView:
        return Icons.calendar_today;
      case todoView:
        return Icons.list_alt;
      default:
        throw UnimplementedError("No implementation for this view");
    }
  }
}
