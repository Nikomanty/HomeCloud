import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/firebase_options.dart';
import 'package:home_cloud/src/home_cloud_bloc_observer.dart';
import 'package:home_cloud/src/home_cloud.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = HomeCloudBlocObserver();
  runApp(const HomeCloud());
}