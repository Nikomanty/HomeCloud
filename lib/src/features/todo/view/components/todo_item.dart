import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';
import 'package:home_cloud/src/widgets/buttons/item_delete_button.dart';
import 'package:home_cloud/src/widgets/buttons/item_edit_button.dart';

class TodoItem extends StatelessWidget {
  final TodoItemModel todoModel;

  const TodoItem({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todoModel.checked,
          onChanged: (value) {
            //TODO: Implement item checking using Cubit
          },
        ),
        Expanded(
          child: Text(
            todoModel.title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              decoration:
              todoModel.checked ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        const EditIconButton(),
        const DeleteIconButton(),
      ],
    );
  }
}