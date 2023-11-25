import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_cloud/core/constants/app_theme_data.dart';
import 'package:home_cloud/core/constants/home_cloud_strings.dart';
import 'package:home_cloud/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/features/calendar/data/calendar_service.dart';
import 'package:home_cloud/features/main_menu/main_menu.dart';
import 'package:home_cloud/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/features/todo/data/todo_service.dart';
import 'package:home_cloud/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/features/weather/data/weather_service.dart';

class HomeCloud extends StatelessWidget {
  const HomeCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalendarCubit(CalendarService())..getData(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(TodoService())..getData(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(WeatherService())..getWeatherData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('fi', 'FI'),
        ],
        title: HomeCloudStrings.appName,
        home: const HomeCloudMainMenu(),
        theme: AppThemeData.getThemeData(),
      ),
    );
  }
}
