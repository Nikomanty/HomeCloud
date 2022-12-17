import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/firebase_options.dart';
import 'package:home_cloud/src/features/calendar/cubit/calendar_cubit.dart';
import 'package:home_cloud/src/features/calendar/data/calendar_repository_impl.dart';
import 'package:home_cloud/src/home_cloud.dart';
import 'package:home_cloud/src/home_cloud_bloc_observer.dart';

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
          create: (context) => CalendarCubit(CalendarRepositoryImpl()),
        ),
      ],
      child: const HomeCloud(),
    ),
  );
}
