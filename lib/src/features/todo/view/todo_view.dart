import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_box_grid.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/src/widgets/buttons/app_bar_action_button.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';


class TodoView extends StatelessWidget {

  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(TodoStrings.todoViewTitle),
        actions: [
          _createNewTodoButton(context),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if(state is TodoInitial){
            context.read<TodoCubit>().getData();
            return const CenteredLoader();
          } else if (state is TodoLoaded) {
            return TodoBoxGrid(allTodoItems: state.todoData);
          } else {
            return const CenteredLoader();
          }
        },
      ),
    );
  }

  AppBarActionButton _createNewTodoButton(BuildContext context) =>
      AppBarActionButton(
        title: TodoStrings.createNewTodoButtonTitle,
        action: () {
          debugPrint("Create new form needs new implementation");
        },
      );
}

