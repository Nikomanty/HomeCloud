import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/models/calendar_event_model.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';


//TODO: This widget should be removed when real calendar is implemented
class CalendarEventPlaceholderView extends StatefulWidget {
  const CalendarEventPlaceholderView({Key? key}) : super(key: key);

  @override
  State<CalendarEventPlaceholderView> createState() =>
      _CalendarEventPlaceholderViewState();
}

class _CalendarEventPlaceholderViewState
    extends State<CalendarEventPlaceholderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state is CalendarInitial) {
              context.read<CalendarCubit>().getData();
              return const CenteredLoader();
            } else if (state is CalendarLoaded) {
              List<CalendarEventModel> calendarEvents = state.calendarData;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Color: ${calendarEvents[0].eventColor?.value}"),
                  Text("Owner: ${calendarEvents[0].eventOwner}"),
                  Text("Title: ${calendarEvents[0].eventTitle}"),
                  Text("Description: ${calendarEvents[0].eventDescription}"),
                  Text("Date: ${calendarEvents[0].eventDate}"),
                  Text("Time: ${calendarEvents[0].eventTime}"),
                ],
              );
            } else {
              return const CenteredLoader();
            }
          },
        ),
      ),
    );
  }
}
