import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/features/todo/models/todo.dart';
import 'package:home_cloud/features/todo/view/forms/todo_create_edit_form.dart';
import 'package:home_cloud/widgets/dialog/delete_item_dialog_content.dart';
import 'package:home_cloud/widgets/dialog/open_dialog_icon_button.dart';

class TodoItem extends StatelessWidget {
  final Todo todoModel;

  const TodoItem({
    super.key,
    required this.todoModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todoModel.checked,
          checkColor: Colors.black,
          fillColor: MaterialStateProperty.all<Color>(AppColors.onPrimary),
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
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration:
                      todoModel.checked ? TextDecoration.lineThrough : null,
                ),
          ),
        ),
        OpenDialogIconButton(
          icon: Icons.edit_outlined,
          dialogContent: TodoCreateEditForm(model: todoModel),
        ),
        OpenDialogIconButton(
          icon: Icons.delete,
          dialogContent: DeleteItemDialogContent(
            itemToDeleteName: todoModel.title,
            deleteItem: () => context.read<TodoCubit>().deleteData(
                  todoModel.documentId,
                ),
          ),
        ),
      ],
    );
  }
}
