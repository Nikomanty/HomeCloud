import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/core/configs/firebase_options.dart';
import 'package:home_cloud/src/core/observers/home_cloud_bloc_observer.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/data/calendar_repository_impl.dart';
import 'package:home_cloud/src/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/src/features/todo/data/todo_repository_impl.dart';
import 'package:home_cloud/src/features/todo/data/todo_service.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/data/weather_repository_impl.dart';
import 'package:home_cloud/src/home_cloud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = HomeCloudBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CalendarCubit(CalendarRepositoryImpl())..getData(),
        ),
        BlocProvider(
          create: (context) =>
              TodoCubit(TodoRepositoryImpl(TodoService()))..getData(),
        ),
        BlocProvider(
          create: (context) =>
              WeatherCubit(WeatherRepositoryImpl())..getWeatherData(),
        ),
      ],
      child: const HomeCloud(),
    ),
  );
}
