import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_utils.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';
import 'package:home_cloud/src/utils/shared_strings.dart';
import 'package:home_cloud/src/utils/utils.dart';
import 'package:home_cloud/src/widgets/dialog/dialog_action_button_row.dart';
import 'package:home_cloud/src/widgets/forms/form_input_field_container.dart';
import 'package:home_cloud/src/widgets/forms/form_text_input_field.dart';
import 'package:intl/intl.dart';

class EventCreateEditForm extends StatefulWidget {
  final DateTime? selectedDate;
  final CalendarEventModel? model;

  const EventCreateEditForm({super.key, this.model, this.selectedDate});

  @override
  State<EventCreateEditForm> createState() => _EventCreateEditFormState();
}

class _EventCreateEditFormState extends State<EventCreateEditForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController eventOwnerTextController = TextEditingController();
  TextEditingController eventTitleTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  Color? eventColor;
  DateTime? eventTime;
  late DateTime eventDate;

  @override
  void initState() {
    super.initState();
    eventDate = widget.selectedDate ?? DateTime.now();
    if (widget.model != null) {
      eventOwnerTextController.text = widget.model!.eventOwner ?? "";
      eventTitleTextController.text = widget.model!.eventTitle;
      eventDescriptionTextController.text = widget.model!.eventDescription ?? "";
      eventDate = widget.model!.eventDate;
      eventColor = widget.model!.eventColor;
      eventTime = widget.model!.eventTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _eventColorPicker(),
          FormInputFieldContainer(
            fieldIcon: Icons.person_outline,
            child: FormTextInputField(
              hintText: CalendarStrings.ownerHintText,
              stringToUpdateTextController: eventOwnerTextController,
            ),
          ),
          FormInputFieldContainer(
            fieldIcon: Icons.title_outlined,
            child: FormTextInputField(
              hintText: CalendarStrings.titleHintText,
              stringToUpdateTextController: eventTitleTextController,
              validatorString: CalendarStrings.eventCreateMustHaveTitle,
            ),
          ),
          FormInputFieldContainer(
            fieldIcon: Icons.text_fields_outlined,
            child: FormTextInputField(
              hintText: CalendarStrings.descriptionHintText,
              stringToUpdateTextController: eventDescriptionTextController,
            ),
          ),
          _eventTimePicker(),
          _eventDatePicker(),
          const Padding(padding: EdgeInsets.all(5)),
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

  Widget _eventColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlockPicker(
          pickerColor: eventColor ?? Colors.transparent,
          availableColors: CalendarUtils.availableItemColors(),
          layoutBuilder: (context, colors, child) {
            return Row(
              children: CalendarUtils.availableItemColors().map((color) {
                return child(color);
              }).toList(),
            );
          },
          onColorChanged: (color) {
            if (color != Colors.transparent) {
              eventColor = color;
            }
          },
        ),
      ],
    );
  }

  FormInputFieldContainer _eventTimePicker() {
    return FormInputFieldContainer(
      fieldIcon: Icons.timer_outlined,
      child: DateTimeField(
        format: DateFormat('HH:mm'),
        initialValue: eventTime,
        decoration: const InputDecoration(
          hintText: CalendarStrings.timeHintText,
          border: InputBorder.none,
        ),
        onShowPicker: (context, currentValue) async {
          TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: eventTime != null
                ? TimeOfDay.fromDateTime(eventTime!)
                : const TimeOfDay(hour: 10, minute: 00),
          );
          eventTime = DateTimeField.convert(time);
          return eventTime;
        },
      ),
    );
  }

  FormInputFieldContainer _eventDatePicker() {
    return FormInputFieldContainer(
      fieldIcon: Icons.date_range_outlined,
      child: DateTimeField(
        format: DateFormat('dd.MM.yyyy'),
        initialValue: eventDate,
        decoration: const InputDecoration(
          hintText: CalendarStrings.dateHintText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null) {
            return CalendarStrings.eventCreateMustHaveDate;
          }
          return null;
        },
        onShowPicker: (context, currentValue) async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: eventDate,
            firstDate: DateTime.now(),
            lastDate: DateFormatUtils.getLastDateOfCalendar(),
          );
          if (selectedDate != null) {
            eventDate = selectedDate;
          }
          return eventDate;
        },
      ),
    );
  }

  void _publishEventToDatabase() {
    context.read<CalendarCubit>().createData(
      widget.model?.documentId,
      {
        "eventOwner": eventOwnerTextController.text,
        "eventTitle": eventTitleTextController.text,
        "eventColor": eventColor?.value,
        "eventDescription": eventDescriptionTextController.text,
        "eventTime": eventTime?.millisecondsSinceEpoch,
        "eventDate": eventDate.millisecondsSinceEpoch,
      },
    );
  }

  String getSnackNotificationText() {
    return widget.model != null
        ? CalendarStrings.eventEdited(eventTitleTextController.text)
        : CalendarStrings.newEventCreated;
  }
}
