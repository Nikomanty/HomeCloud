import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/app_colors.dart';
import 'package:home_cloud/src/utils/styles.dart';

class WeatherUtils {
  static String getWeatherIconPath(String weatherType) {
    switch (weatherType) {
      case "Clear":
        return "assets/clear.png";
      case "Rain":
        return "assets/rain.png";
      case "Mist":
        return "assets/mist.png";
      case "For":
        return "assets/fog.png";
      case "Snow":
        return "assets/snow.png";
      case "Thunderstorm":
        return "assets/thunderstorm.png";
      case "Clouds":
      default:
        return "assets/clouds.png";
    }
  }

  static BoxDecoration getWeatherBoxDecoration() {
    return BoxDecoration(
      color: AppColors.primary,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      border: Border.all(color: Colors.black38),
      boxShadow: Styles.itemShadow(),

    );
  }

  static Padding weatherContentDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        thickness: 1,
        color: Colors.grey,
      ),
    );
  }
}
