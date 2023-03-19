import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';

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

  static List<TodoModel> getTodoItemsByWeekday(
      List<TodoModel> allTodoItems, String weekDay) {
    List<TodoModel> eventsForGivenDate = [];
    for (var element in allTodoItems) {
      if (element.weekDay == weekDay) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }
}
