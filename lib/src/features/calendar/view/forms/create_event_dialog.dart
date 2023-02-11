import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_utils.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';
import 'package:home_cloud/src/utils/home_cloud_strings.dart';
import 'package:home_cloud/src/widgets/forms/form_input_field_container.dart';
import 'package:home_cloud/src/widgets/forms/form_text_input_widget.dart';
import 'package:intl/intl.dart';

class CreateEventDialog extends StatefulWidget {
  final DateTime? selectedDate;
  final CalendarEventModel? model;

  const CreateEventDialog({super.key, this.model, this.selectedDate});

  @override
  State<CreateEventDialog> createState() => _CreateEventDialogState();
}

class _CreateEventDialogState extends State<CreateEventDialog> {
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
      eventDescriptionTextController.text =
          widget.model!.eventDescription ?? "";
      eventDate = widget.model!.eventDate;
      eventColor = widget.model!.eventColor;
      eventTime = widget.model!.eventTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: _eventForm(),
    );
  }

  Form _eventForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _eventColorPicker(),
          FormInputFieldContainer(
            fieldIcon: Icons.person_outline,
            child: FormTextInputWidget(
              hintText: CalendarStrings.ownerHintText,
              valueKey: "owner",
              stringToUpdateTextController: eventOwnerTextController,
            ),
          ),
          FormInputFieldContainer(
            fieldIcon: Icons.title_outlined,
            child: FormTextInputWidget(
              hintText: CalendarStrings.titleHintText,
              valueKey: "title",
              stringToUpdateTextController: eventTitleTextController,
              validatorString: CalendarStrings.eventCreateMustHaveTitle,
            ),
          ),
          FormInputFieldContainer(
            fieldIcon: Icons.text_fields_outlined,
            child: FormTextInputWidget(
              hintText: CalendarStrings.descriptionHintText,
              valueKey: "description",
              stringToUpdateTextController: eventDescriptionTextController,
            ),
          ),
          _eventTimePicker(),
          _eventDatePicker(),
          const Padding(padding: EdgeInsets.all(5)),
          _buttonRow(),
        ],
      ),
    );
  }

  Widget _eventColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlockPicker(
          key: const ValueKey('color'),
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
          hintText: CalendarStrings.eventCreatePickDateHint,
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

  Widget _buttonRow() {
    TextStyle? actionsButtonTextStyle =
        Theme.of(context).textTheme.labelMedium?.merge(
              const TextStyle(color: Colors.blue),
            );
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
                ? HomeCloudString.confirmItemEdition
                : HomeCloudString.confirmCreate,
            style: actionsButtonTextStyle,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            HomeCloudString.cancelString,
            style: actionsButtonTextStyle,
          ),
        ),
      ],
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

  void _showNotificationSnack() => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.model != null
              ? CalendarStrings.eventEdited(eventTitleTextController.text)
              : CalendarStrings.newEventCreated),
          backgroundColor: Colors.purple.shade300,
        ),
      );
}
