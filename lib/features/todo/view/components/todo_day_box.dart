import 'package:flutter/material.dart';
import 'package:home_cloud/features/todo/models/todo.dart';
import 'package:home_cloud/features/todo/view/components/todo_item.dart';
import 'package:home_cloud/widgets/containers/titleable_outline_box.dart';

class TodoDayBox extends StatelessWidget {
  final String weekDay;
  final List<Todo> todoItems;

  const TodoDayBox({
    super.key,
    required this.weekDay,
    required this.todoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TitleableOutlineBox(
        title: weekDay,
        content: ListView(
          children: todoItems.map((item) => TodoItem(todoModel: item)).toList(),
        ),
      ),
    );
  }
}
