import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/core/utils/date_formatters.dart';
import 'package:home_cloud/core/utils/utils.dart';
import 'package:home_cloud/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/features/calendar/models/calendar_event.dart';
import 'package:home_cloud/features/calendar/view/calendar_grid/calendar_builder_helper.dart';
import 'package:home_cloud/features/calendar/view/event_lists/calendar_event_list.dart';
import 'package:home_cloud/features/calendar/view/forms/event_create_edit_form.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/features/calendar/view/utils/calendar_utils.dart';
import 'package:home_cloud/widgets/buttons/app_bar_action_button.dart';
import 'package:home_cloud/widgets/error/centered_error_text.dart';
import 'package:home_cloud/widgets/loading/centered_loader.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  List<CalendarEvent> allEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2.0,
        title: const Text(CalendarStrings.calendarViewName),
        actions: [
          IconButton(
              splashRadius: 25,
              onPressed: () => context.read<CalendarCubit>().updateData(),
              icon: const Icon(Icons.update)),
          ..._appBarActionRow(),
        ],
      ),
      body: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          if (state.status == CalendarStatus.initial) {
            context.read<CalendarCubit>().getData();
            return const CenteredLoader();
          } else if (state.status == CalendarStatus.error) {
            return CenteredErrorText(
              errorMessage: state.exception.toString(),
            );
          } else {
            allEvents = state.calendarData ?? [];
            if (Utils.isViewLandscape(context)) {
              return Row(children: _homeCalendarViewContent());
            } else {
              return Column(children: _homeCalendarViewContent());
            }
          }
        },
      ),
    );
  }

  List<Widget> _homeCalendarViewContent() => [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: _tableCalendar(),
          ),
        ),
        Expanded(
          child: CalendarEventList(
            eventsList: CalendarUtils.getAllEventsByDate(
              allEvents,
              _selectedDate,
            ),
          ),
        ),
      ];

  TableCalendar _tableCalendar() => TableCalendar(
        locale: Localizations.localeOf(context).languageCode,
        firstDay: DateFormatters.getFirstDateOfCalendar(),
        lastDay: DateFormatters.getLastDateOfCalendar(),
        focusedDay: _focusedDate,
        weekendDays: const [DateTime.sunday, 6],
        startingDayOfWeek: StartingDayOfWeek.monday,
        selectedDayPredicate: (date) {
          return isSameDay(_selectedDate, date);
        },
        onDaySelected: (selectedDate, focusedDate) {
          _updateDates(selectedDate, selectedDate);
        },
        onDayLongPressed: (selectedDate, focusedDate) {
          _openEventCreationDialog(selectedDate);
        },
        headerStyle: CalendarUtils.getCalendarHeaderStyle(context),
        calendarStyle: CalendarStyle(
          tableBorder: TableBorder.all(color: Colors.grey, width: 1),
        ),
        shouldFillViewport: true,
        calendarBuilders: CalendarBuilderHelper.getHomeCalendarBuilder(),
        eventLoader: (date) =>
            CalendarUtils.getAllEventsByDate(allEvents, date),
      );

  List<Widget> _appBarActionRow() {
    if (Utils.isViewLandscape(context)) {
      return [
        AppBarActionButton(
          title: CalendarStrings.resetTodayButtonTitle,
          action: () => _updateDates(DateTime.now(), DateTime.now()),
        ),
        AppBarActionButton(
          title: CalendarStrings.selectDateButtonTitle,
          action: () => _openDateSelectionPicker(),
        ),
        AppBarActionButton(
          title: CalendarStrings.createNewEventButtonTitle,
          action: () => _openEventCreationDialog(_selectedDate),
        ),
      ];
    } else {
      return [
        _actionPopUpMenu(),
      ];
    }
  }

  Future<void> _openDateSelectionPicker() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateFormatters.getFirstDateOfCalendar(),
      lastDate: DateFormatters.getLastDateOfCalendar(),
    );
    if (newDate != null) {
      _updateDates(newDate, newDate);
    }
  }

  Future<void> _openEventCreationDialog(DateTime selectedDate) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            scrollable: true,
            content: EventCreateEditForm(selectedDate: selectedDate));
      },
    );
  }

  void _updateDates(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      _selectedDate = selectedDate;
      _focusedDate = focusedDate;
    });
  }

  Widget _actionPopUpMenu() {
    return PopupMenuButton(
      offset: const Offset(0, 50),
      icon: const Icon(Icons.menu),
      onSelected: (value) async {
        switch (value) {
          case "reset_date":
            return _updateDates(DateTime.now(), DateTime.now());
          case "select_date":
            return _openDateSelectionPicker();
          case "create_new_event":
            return _openEventCreationDialog(_selectedDate);
          default:
            throw UnimplementedError();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: "reset_date",
          child: Text(
            CalendarStrings.resetTodayButtonTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        PopupMenuItem<String>(
          value: "select_date",
          child: Text(
            CalendarStrings.selectDateButtonTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        PopupMenuItem<String>(
          value: "create_new_event",
          child: Text(
            CalendarStrings.createNewEventButtonTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
