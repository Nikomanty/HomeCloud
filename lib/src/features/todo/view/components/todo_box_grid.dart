import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_day_box.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_utils.dart';

class TodoBoxGrid extends StatelessWidget {
  final List<TodoModel> allTodoItems;

  const TodoBoxGrid({super.key, required this.allTodoItems});

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
                  Expanded(child: _todoBoxList(TodoUtils.leftTodoBoxes)),
                  Expanded(child: _todoBoxList(TodoUtils.middleTodoBoxes)),
                ],
              ),
            ),
            Expanded(
              child: TodoDayBox(
                weekDay: TodoStrings.othersString,
                todoItems: TodoUtils.getTodoItemsByWeekday(
                    allTodoItems, TodoStrings.othersString),
              ),
            ),
          ],
        ));
  }

  Widget _todoBoxList(List<String> boxes) {
    return Column(
      children: boxes.map((todoBox) {
        return Expanded(
          child: TodoDayBox(
            weekDay: todoBox,
            todoItems: TodoUtils.getTodoItemsByWeekday(allTodoItems, todoBox),
          ),
        );
      }).toList(),
    );
  }
}
