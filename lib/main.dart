import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_cloud/core/configs/firebase_options.dart';

import 'package:home_cloud/home_cloud.dart';

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
  runApp(const HomeCloud());
}
