import 'package:home_cloud/features/todo/models/todo.dart';
import 'package:home_cloud/features/todo/view/utils/todo_strings.dart';

class TodoUtils {
  static List<String> allTodoBoxes = [
    TodoStrings.mondayString,
    TodoStrings.tuesdayString,
    TodoStrings.wednesdayString,
    TodoStrings.thursdayString,
    TodoStrings.fridayString,
    TodoStrings.saturdayString,
    TodoStrings.sundayString,
    TodoStrings.othersString,
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

  static List<Todo> getTodoItemsByWeekday(
      List<Todo> allTodoItems, String weekDay) {
    List<Todo> eventsForGivenDate = [];
    for (var element in allTodoItems) {
      if (element.weekDay == weekDay) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }
}
