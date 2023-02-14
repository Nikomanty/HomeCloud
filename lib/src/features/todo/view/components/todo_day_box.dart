import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_item.dart';
import 'package:home_cloud/src/widgets/containers/titled_outline_box.dart';

class TodoDayBox extends StatelessWidget {
  final String weekDay;
  final List<TodoModel> todoItems;

  const TodoDayBox({
    super.key,
    required this.weekDay,
    required this.todoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TitledOutlineBox(
        title: weekDay,
        content: ListView(
          children: todoItems
              .map((item) => TodoItem(todoModel: item))
              .toList(),
        ),
      ),
    );
  }
}
