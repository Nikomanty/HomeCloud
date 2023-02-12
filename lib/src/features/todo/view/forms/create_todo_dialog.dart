import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_utils.dart';
import 'package:home_cloud/src/widgets/forms/form_input_field_container.dart';
import 'package:home_cloud/src/widgets/forms/form_text_input_fieldt.dart';

class CreateTodoDialog extends StatefulWidget {
  final TodoModel? model;

  const CreateTodoDialog({super.key, this.model});

  @override
  State<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController todoTitleTextController = TextEditingController();
  late String todoWeekDay;
  late bool todoIsChecked;
  String? documentId;

  @override
  void initState() {
    super.initState();
    todoTitleTextController.text = widget.model?.title ?? "";
    todoWeekDay = widget.model?.weekDay ?? TodoStrings.othersString;
    todoIsChecked = widget.model?.checked ?? false;
    documentId = widget.model?.documentId;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormInputFieldContainer(
            fieldIcon: Icons.title_outlined,
            child: FormTextInputField(
              hintText: TodoStrings.todoTextHintText,
              stringToUpdateTextController: todoTitleTextController,
              validatorString: TodoStrings.todoMustHaveText,
            ),
          ),
          FormInputFieldContainer(
              fieldIcon: Icons.today_outlined,
              child: DropdownButtonFormField(
                value: todoWeekDay,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(border: InputBorder.none),
                items: TodoUtils.allTodoBoxes
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  todoWeekDay = value.toString();
                },
              )),
          _buttonRow(),
        ],
      ),
    );
  }

  Widget _buttonRow() {
    TextStyle? actionsButtonTextStyle = Theme.of(context)
        .textTheme
        .labelMedium
        ?.merge(const TextStyle(color: Colors.blue));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                _publishEventToDatabase();
                _showNotificationSnack();
                Navigator.of(context).pop();
              }
            },
            child: Text(
              widget.model != null
                  ? TodoStrings.confirmItemEdition
                  : TodoStrings.confirmCreate,
              style: actionsButtonTextStyle,
            )),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            TodoStrings.cancelString,
            style: actionsButtonTextStyle,
          ),
        ),
      ],
    );
  }

  void _publishEventToDatabase() {
    context.read<TodoCubit>().createData(
      documentId,
      {
        "title": todoTitleTextController.text,
        "checked": todoIsChecked,
        "weekDay": todoWeekDay,
      },
    );
  }

  void _showNotificationSnack() => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.model != null
                ? TodoStrings.todoEdited(todoTitleTextController.text)
                : TodoStrings.newTodoCreated,
          ),
          backgroundColor: Colors.green,
        ),
      );
}
