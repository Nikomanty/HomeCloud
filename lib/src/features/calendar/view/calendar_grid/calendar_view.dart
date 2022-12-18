import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/styles.dart';
import '../../../../widgets/buttons/app_bar_action_button.dart';
import '../events/calendar_event_list.dart';
import '../res/calendar_strings.dart';
import 'calendar_builder_helper.dart';

//TODO: This widget should be removed when real calendar is implemented
class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

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
        title: const Text(CalendarStrings.calendarViewName),
        actions: [
          _resetDateTodayButton(),
          _selectDateButton(),
        ],
      ),
      body: Center(
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state is CalendarInitial) {
              context.read<CalendarCubit>().getData();
              return const CenteredLoader();
            } else if (state is CalendarLoaded) {
              allEvents = state.calendarData;
              return _homeCalendarView();
            } else {
              return const CenteredLoader();
            }
          },
        ),
      ),
    );
  }

  _homeCalendarView() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                  child: _tableCalendar(),
                ),
              ),
              Expanded(
                child: _todaySelectedEventsLists(),
              ),
            ],
          ),
        ),
        Expanded(
          child: CalendarEventList(
            title: CalendarStrings.allCalendarEvents,
            eventsList: allEvents,
          ),
        ),
      ],
    );
  }

  TableCalendar _tableCalendar() => TableCalendar(
        locale: Localizations.localeOf(context).languageCode,
        firstDay: DateFormatUtils.getFirstDateOfCalendar(),
        lastDay: DateFormatUtils.getLastDateOfCalendar(),
        focusedDay: _focusedDate,
        weekendDays: const [DateTime.sunday, 6],
        onPageChanged: (focusedDate) {
          _focusedDate = focusedDate;
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        selectedDayPredicate: (date) {
          return isSameDay(_selectedDate, date);
        },
        onDaySelected: (selectedDate, focusedDate) {
          _updateDates(selectedDate, selectedDate);
        },
        onDayLongPressed: (selectedDate, focusedDate) {
          //TODO: Implemented with forms
          debugPrint("Currently disabled");
        },
        headerStyle: Styles.getCalendarHeaderStyle(),
        calendarStyle: CalendarStyle(
          tableBorder: TableBorder.all(color: Colors.grey, width: 1),
        ),
        shouldFillViewport: true,
        calendarBuilders: CalendarBuilderHelper.getHomeCalendarBuilder(),
        eventLoader: (date) => _getAllEventsByDate(allEvents, date),
      );

  Widget _todaySelectedEventsLists() => Row(
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
            firstDate: DateFormatUtils.getFirstDateOfCalendar(),
            lastDate: DateFormatUtils.getLastDateOfCalendar(),
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
