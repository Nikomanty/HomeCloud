import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/main_menu/main_menu.dart';

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
      home: const HomeCloudMainMenu(),
    );
  }
}
