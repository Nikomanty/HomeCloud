import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_day_box.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_utils.dart';


class TodoBoxGrid extends StatelessWidget {
  final List<TodoItemModel> allTodoItems;

  const TodoBoxGrid({Key? key, required this.allTodoItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                todoBoxList(TodoUtils.leftTodoBoxes),
                todoBoxList(TodoUtils.middleTodoBoxes),
              ],
            ),
          ),
          Expanded(
            child: TodoDayBox(
              weekDay: TodoStrings.othersString,
              todoItems: _getTodoItemsByWeekday(TodoStrings.othersString),
            ),
          ),
        ],
      ),
    );
  }

  Widget todoBoxList(List<String> boxes) {
    return Expanded(
      child: Column(
        children: boxes.map((todoBox) {
          return Expanded(
            child: TodoDayBox(
              weekDay: todoBox,
              todoItems: _getTodoItemsByWeekday(todoBox),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<TodoItemModel> _getTodoItemsByWeekday(String weekDay) {
    List<TodoItemModel> eventsForGivenDate = [];
    for (var element in allTodoItems) {
      if (element.weekDay == weekDay) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }

}
