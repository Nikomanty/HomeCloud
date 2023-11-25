import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/core/constants/app_colors.dart';
import 'package:home_cloud/core/constants/home_cloud_strings.dart';
import 'package:home_cloud/core/constants/styles.dart';
import 'package:home_cloud/core/utils/date_formatters.dart';
import 'package:home_cloud/core/utils/utils.dart';
import 'package:home_cloud/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_utils.dart';
import 'package:home_cloud/widgets/dialog/dialog_action_button_row.dart';
import 'package:home_cloud/widgets/forms/form_field_container.dart';
import 'package:home_cloud/widgets/forms/form_text_input_field.dart';
import 'package:intl/intl.dart';

class EventCreateEditForm extends StatefulWidget {
  final DateTime? selectedDate;
  final CalendarEvent? model;

  const EventCreateEditForm({super.key, this.model, this.selectedDate});

  @override
  State<EventCreateEditForm> createState() => _EventCreateEditFormState();
}

class _EventCreateEditFormState extends State<EventCreateEditForm> {
  final _formKey = GlobalKey<FormState>();

  String eventOwner = "";
  TextEditingController eventTitleTextController = TextEditingController();
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  Color eventColor = Colors.white;
  DateTime? eventTime;
  late DateTime eventDate;

  @override
  void initState() {
    super.initState();
    eventDate = widget.selectedDate ?? DateTime.now();
    if (widget.model != null) {
      eventOwner = widget.model!.eventOwner ?? "";
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildColorIndicator(),
          FormFieldContainer(
            fieldIcon: Icons.person_outline,
            child: _buildEventOwnerSelection(),
          ),
          FormFieldContainer(
            fieldIcon: Icons.title_outlined,
            child: FormTextInputField(
              hintText: CalendarStrings.titleHintText,
              stringToUpdateTextController: eventTitleTextController,
              validatorString: CalendarStrings.eventCreateMustHaveTitle,
            ),
          ),
          FormFieldContainer(
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
                ? HomeCloudStrings.confirmItemEdition
                : HomeCloudStrings.confirmCreate,
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

  Widget _buildColorIndicator() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: double.infinity,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: Styles.smallRoundedCorner,
          shape: BoxShape.rectangle,
          color: eventColor,
        ),
      ),
    );
  }

  Widget _buildEventOwnerSelection() {
    return PopupMenuButton(
      splashRadius: 0,
      onSelected: (value) => _setOwner("$value"),
      position: PopupMenuPosition.under,
      itemBuilder: (context) => CalendarUtils.eventOwners()
          .map(
            (eventOwner) => PopupMenuItem<String>(
              value: eventOwner,
              child: Text(
                eventOwner,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
          .toList(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          eventOwner.isNotEmpty ? eventOwner : CalendarStrings.ownerHintText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: eventOwner.isNotEmpty
                    ? AppColors.onPrimary
                    : AppColors.onPrimaryVariant,
              ),
        ),
      ),
    );
  }

  void _setOwner(String value) {
    setState(() {
      switch (value) {
        case "Niko":
          eventOwner = "Niko";
          eventColor = Colors.green;
          break;
        case "Minna":
          eventOwner = "Minna";
          eventColor = Colors.red.shade300;
          break;
        case "Melina":
          eventOwner = "Melina";
          eventColor = Colors.orange.shade300;
          break;
        case "Rasmus":
          eventOwner = "Rasmus";
          eventColor = Colors.blue.shade300;
          break;
        case "Yhteinen":
          eventOwner = "Yhteinen";
          eventColor = Colors.white;
          break;
        default:
          throw UnimplementedError();
      }
    });
  }

  FormFieldContainer _eventTimePicker() {
    return FormFieldContainer(
      fieldIcon: Icons.timer_outlined,
      child: DateTimeField(
        format: DateFormat('HH:mm'),
        initialValue: eventTime,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: CalendarStrings.timeHintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.onPrimaryVariant),
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

  FormFieldContainer _eventDatePicker() {
    return FormFieldContainer(
      fieldIcon: Icons.date_range_outlined,
      child: DateTimeField(
        format: DateFormat('dd.MM.yyyy'),
        initialValue: eventDate,
        style: Theme.of(context).textTheme.bodyMedium,
        resetIcon: const Icon(Icons.close, color: AppColors.onPrimary),
        decoration: InputDecoration(
          hintText: CalendarStrings.dateHintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.onPrimaryVariant),
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
            lastDate: DateFormatters.getLastDateOfCalendar(),
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
    BlocProvider.of<CalendarCubit>(context).createData(
      widget.model?.documentId,
      {
        "eventOwner": eventOwner,
        "eventTitle": eventTitleTextController.text,
        "eventColor": eventColor.value,
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
