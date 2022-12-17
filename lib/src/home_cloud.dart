import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/calendar/cubit/calendar_cubit.dart';
import 'features/calendar/data/calendar_repository_impl.dart';
import 'features/calendar/view/calendar_event_placeholder_view.dart';

class HomeCloud extends StatelessWidget {
  static const String appTitle = "Home Cloud";

  const HomeCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!),
      title: appTitle,
      home: BlocProvider(
        create: (context) => CalendarCubit(CalendarRepositoryImpl()),
        child: const CalendarEventPlaceholderView(),
      ),
    );
  }
}
