import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';
import 'package:home_cloud/src/features/todo/view/forms/create_todo_dialog.dart';
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
            context.read<TodoCubit>().createData(
              todoModel.documentId,
              {
                'title': todoModel.title,
                'checked': value,
                'weekDay': todoModel.weekDay,
              },
            );
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
        EditIconButton(editDialog: CreateTodoDialog(model: todoModel)),
        DeleteIconButton(
          itemToDeleteName: todoModel.title,
          deleteItem: () => context.read<TodoCubit>().deleteData(
                todoModel.documentId,
              ),
        ),
      ],
    );
  }
}
