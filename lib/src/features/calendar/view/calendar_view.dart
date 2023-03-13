import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/core/utils/date_formatters.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/features/calendar/view/calendar_grid/calendar_builder_helper.dart';
import 'package:home_cloud/src/features/calendar/view/event_lists/calendar_event_list.dart';
import 'package:home_cloud/src/features/calendar/view/forms/event_create_edit_form.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_strings.dart';
import 'package:home_cloud/src/features/calendar/view/utils/calendar_utils.dart';
import 'package:home_cloud/src/widgets/buttons/app_bar_action_button.dart';
import 'package:home_cloud/src/widgets/error/centered_error_text.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  List<CalendarEventModel> allEvents = [];

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
          _resetDateTodayButton(),
          _selectDateButton(),
          _createNewEventButton(),
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
            return _homeCalendarView();
          }
        },
      ),
    );
  }

  Widget _homeCalendarView() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: _tableCalendar(),
          ),
        ),
        Expanded(
          child: _todaySelectedEventsLists(),
        ),
      ],
    );
  }

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
        eventLoader: (date) => _getAllEventsByDate(allEvents, date),
      );

  Widget _todaySelectedEventsLists() => Column(
        children: [
          Expanded(
            child: CalendarEventList(
              title: CalendarStrings.todayCalendarEvents,
              eventsList: _getAllEventsByDate(allEvents, DateTime.now()),
            ),
          ),
          Expanded(
            child: CalendarEventList(
              title: CalendarStrings.selectedDayCalendarEvents,
              eventsList: _getAllEventsByDate(allEvents, _selectedDate),
            ),
          ),
        ],
      );

  AppBarActionButton _selectDateButton() => AppBarActionButton(
        title: CalendarStrings.selectDateButton,
        action: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateFormatters.getFirstDateOfCalendar(),
            lastDate: DateFormatters.getLastDateOfCalendar(),
          );
          if (newDate != null) {
            _updateDates(newDate, newDate);
          }
        },
      );

  AppBarActionButton _resetDateTodayButton() => AppBarActionButton(
        title: CalendarStrings.resetTodayButton,
        action: () => _updateDates(DateTime.now(), DateTime.now()),
      );

  AppBarActionButton _createNewEventButton() => AppBarActionButton(
        title: CalendarStrings.createNewEventButtonTitle,
        action: () => _openEventCreationDialog(_selectedDate),
      );

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

  static List<CalendarEventModel> _getAllEventsByDate(
      List<CalendarEventModel> allEvents, DateTime date) {
    List<CalendarEventModel> eventsForGivenDate = [];
    for (var element in allEvents) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      if (dateFormat.format(element.eventDate) == dateFormat.format(date)) {
        eventsForGivenDate.add(element);
      }
    }
    return eventsForGivenDate;
  }
}
