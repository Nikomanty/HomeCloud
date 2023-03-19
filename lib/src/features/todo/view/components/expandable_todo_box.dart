import 'package:flutter/material.dart';
import 'package:home_cloud/src/core/constants/app_colors.dart';
import 'package:home_cloud/src/core/constants/styles.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/components/todo_item.dart';
import 'package:home_cloud/src/widgets/containers/titleable_outline_box.dart';

class ExpandableTodoBox extends StatefulWidget {
  final String title;
  final List<TodoModel> todos;

  const ExpandableTodoBox({
    super.key,
    required this.title,
    required this.todos,
  });

  @override
  State<ExpandableTodoBox> createState() => _ExpandableTodoBoxState();
}

class _ExpandableTodoBoxState extends State<ExpandableTodoBox> {
  bool showTodoBoxContent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => setState(() {
              showTodoBoxContent = !showTodoBoxContent;
              debugPrint(showTodoBoxContent.toString());
            }),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                boxShadow: Styles.itemShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title,
                      style: Theme.of(context).textTheme.bodyLarge),
                  Icon(showTodoBoxContent
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          if (showTodoBoxContent)
            TitleableOutlineBox(
              content: SizedBox(
                width: double.infinity,
                child: Column(
                  children: widget.todos
                      .map((todo) => TodoItem(todoModel: todo))
                      .toList(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
