import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/core/constants/shared_strings.dart';
import 'package:home_cloud/src/core/utils/utils.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_strings.dart';
import 'package:home_cloud/src/features/todo/view/utils/todo_utils.dart';
import 'package:home_cloud/src/widgets/dialog/dialog_action_button_row.dart';
import 'package:home_cloud/src/widgets/forms/form_field_container.dart';
import 'package:home_cloud/src/widgets/forms/form_text_input_field.dart';

class TodoCreateEditForm extends StatefulWidget {
  final TodoModel? model;

  const TodoCreateEditForm({super.key, this.model});

  @override
  State<TodoCreateEditForm> createState() => _TodoCreateEditFormState();
}

class _TodoCreateEditFormState extends State<TodoCreateEditForm> {
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
          FormFieldContainer(
            fieldIcon: Icons.title_outlined,
            child: FormTextInputField(
              hintText: TodoStrings.todoTextHintText,
              stringToUpdateTextController: todoTitleTextController,
              validatorString: TodoStrings.todoMustHaveText,
            ),
          ),
          FormFieldContainer(
              fieldIcon: Icons.today_outlined,
              child: DropdownButtonFormField(
                value: todoWeekDay,
                style: Theme.of(context).textTheme.bodyMedium,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(border: InputBorder.none),
                items: TodoUtils.allTodoBoxes
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  todoWeekDay = value.toString();
                },
              )),
          DialogActionButtonRow(
            confirmButtonTitle: widget.model != null
                ? SharedStrings.confirmItemEdition
                : SharedStrings.confirmCreate,
            confirmAction: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                _publishEventToDatabase();
                Utils.showNotificationSnack(
                  context: context,
                  notificationString: getSnackNotificationText(),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _publishEventToDatabase() {
    context.read<TodoCubit>().createData(documentId, {
      "title": todoTitleTextController.text,
      "checked": todoIsChecked,
      "weekDay": todoWeekDay,
    });
  }

  String getSnackNotificationText() {
    return widget.model != null
        ? TodoStrings.todoEdited(todoTitleTextController.text)
        : TodoStrings.newTodoCreated;
  }
}
