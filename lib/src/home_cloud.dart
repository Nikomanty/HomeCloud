import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_cloud/src/core/constants/app_theme_data.dart';
import 'package:home_cloud/src/core/constants/home_cloud_strings.dart';
import 'package:home_cloud/src/features/main_menu/main_menu.dart';

class HomeCloud extends StatelessWidget {
  const HomeCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
