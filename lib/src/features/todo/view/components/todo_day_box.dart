import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_item.dart';

class TodoDayBox extends StatefulWidget {
  final String weekDay;
  final List<TodoModel> todoItems;

  const TodoDayBox({
    super.key,
    required this.weekDay,
    required this.todoItems,
  });

  @override
  State<TodoDayBox> createState() => _TodoDayBoxState();
}

class _TodoDayBoxState extends State<TodoDayBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: _todoList(),
          ),
          Positioned(
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Text(widget.weekDay),
            ),
          ),
        ],
      ),
    );
  }

  Widget _todoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListView(
        children: widget.todoItems
            .map((item) => TodoItem(todoModel: item))
            .toList(),
      ),
    );
  }
}
