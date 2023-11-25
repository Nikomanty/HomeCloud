import 'package:flutter/material.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/core/constants/styles.dart';
import 'package:home_cloud/features/todo/models/todo.dart';
import 'package:home_cloud/features/todo/view/components/todo_item.dart';
import 'package:home_cloud/widgets/containers/titleable_outline_box.dart';

class ExpandableTodoBox extends StatefulWidget {
  final String title;
  final List<Todo> todos;

  const ExpandableTodoBox({
    super.key,
    required this.title,
    required this.todos,
  });

  @override
  State<ExpandableTodoBox> createState() => _ExpandableTodoBoxState();
}

class _ExpandableTodoBoxState extends State<ExpandableTodoBox>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _todoBoxAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _todoBoxAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => setState(() => _toggleTodos()),
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
                  AnimatedRotation(
                    turns: _isExpanded ? -0.5 : 0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                    child: const Icon(Icons.arrow_drop_down_outlined),
                  )
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _todoBoxAnimation,
            child: TitleableOutlineBox(
              content: SizedBox(
                width: double.infinity,
                child: Column(
                  children: widget.todos
                      .map((todo) => TodoItem(todoModel: todo))
                      .toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _toggleTodos() {
    if (_todoBoxAnimation.status != AnimationStatus.completed) {
      _animationController.forward();
    } else {
      _animationController.animateBack(0);
    }
    _isExpanded = !_isExpanded;
  }
}
