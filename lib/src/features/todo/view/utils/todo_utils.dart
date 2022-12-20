import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';

class TodoUtils {
  static List<String> allTodoBoxes = [
    TodoStrings.othersString,
    TodoStrings.mondayString,
    TodoStrings.tuesdayString,
    TodoStrings.wednesdayString,
    TodoStrings.thursdayString,
    TodoStrings.fridayString,
    TodoStrings.saturdayString,
    TodoStrings.sundayString,
  ];

  static List<String> weekDays = [
    TodoStrings.othersString,
    TodoStrings.mondayString,
    TodoStrings.tuesdayString,
    TodoStrings.wednesdayString,
    TodoStrings.thursdayString,
    TodoStrings.fridayString,
  ];

  static List<String> weekendDay = [
    TodoStrings.saturdayString,
    TodoStrings.sundayString,
  ];

  static List<String> leftTodoBoxes = [
    TodoStrings.mondayString,
    TodoStrings.tuesdayString,
    TodoStrings.wednesdayString,
    TodoStrings.thursdayString,
  ];

  static List<String> middleTodoBoxes = [
    TodoStrings.fridayString,
    TodoStrings.saturdayString,
    TodoStrings.sundayString,
  ];
}