import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/core/utils/utils.dart';
import 'package:home_cloud/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/features/todo/view/components/expandable_todo_box.dart';
import 'package:home_cloud/features/todo/view/components/todo_box_grid.dart';
import 'package:home_cloud/features/todo/view/forms/todo_create_edit_form.dart';
import 'package:home_cloud/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/features/todo/view/utils/todo_utils.dart';
import 'package:home_cloud/widgets/buttons/app_bar_action_button.dart';
import 'package:home_cloud/widgets/error/centered_error_text.dart';
import 'package:home_cloud/widgets/loading/centered_loader.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(TodoStrings.todoViewTitle),
        actions: [
          IconButton(
              splashRadius: 25,
              onPressed: () => context.read<TodoCubit>().getData(),
              icon: const Icon(Icons.update)),
          _createNewTodoButton(context),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading) {
            context.read<TodoCubit>().getData();
            return const CenteredLoader();
          } else if (state.status == TodoStatus.error) {
            return CenteredErrorText(
              errorMessage: state.exception.toString(),
            );
          } else {
            if (Utils.isViewLandscape(context)) {
              return TodoBoxGrid(allTodoItems: state.todoData ?? []);
            } else {
              return ListView(
                children: TodoUtils.allTodoBoxes.map<Widget>(
                  (todoBox) {
                    return ExpandableTodoBox(
                      title: todoBox,
                      todos: TodoUtils.getTodoItemsByWeekday(
                          state.todoData ?? [], todoBox),
                    );
                  },
                ).toList(),
              );
            }
          }
        },
      ),
    );
  }

  AppBarActionButton _createNewTodoButton(BuildContext context) =>
      AppBarActionButton(
        title: TodoStrings.createNewTodoButtonTitle,
        action: () => showDialog<Widget>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              scrollable: true,
              content: TodoCreateEditForm(),
            );
          },
        ),
      );
}
