import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';


//TODO: This widget should be removed when real todo list is implemented
class TodoItemPlaceholderView extends StatefulWidget {
  const TodoItemPlaceholderView({Key? key}) : super(key: key);

  @override
  State<TodoItemPlaceholderView> createState() =>
      _TodoItemPlaceholderViewState();
}

class _TodoItemPlaceholderViewState
    extends State<TodoItemPlaceholderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoInitial) {
              context.read<TodoCubit>().getData();
              return const CenteredLoader();
            } else if (state is TodoLoaded) {
              List<TodoItemModel> calendarEvents = state.todoData;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Title: ${calendarEvents[0].title}"),
                  Text("WeekDay: ${calendarEvents[0].weekDay}"),
                  Text("Checked: ${calendarEvents[0].checked}"),
                ],
              );
            } else {
              return const CenteredLoader();
            }
          },
        ),
      ),
    );
  }
}
