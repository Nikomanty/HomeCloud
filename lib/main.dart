import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/core/configs/firebase_options.dart';
import 'package:home_cloud/src/core/observers/home_cloud_bloc_observer.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/data/calendar_service.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/data/todo_service.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/data/weather_service.dart';
import 'package:home_cloud/src/home_cloud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    final double screenShortestSide =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide;
    if (screenShortestSide < 600) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
    }
  });

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = HomeCloudBlocObserver();
  runApp(
    MultiBlocProvider(
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
      child: const HomeCloud(),
    ),
  );
}
