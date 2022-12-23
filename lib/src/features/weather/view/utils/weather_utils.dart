import 'package:flutter/material.dart';
import 'package:home_cloud/src/utils/styles.dart';

class WeatherUtils {
  static String getWeatherIconPath(String weatherType) {
    switch (weatherType) {
      case "Clear":
        return "images/clear.png";
      case "Rain":
        return "images/rain.png";
      case "Mist":
        return "images/mist.png";
      case "For":
        return "images/fog.png";
      case "Snow":
        return "images/snow.png";
      case "Thunderstorm":
        return "images/thunderstorm.png";
      case "Clouds":
      default:
        return "images/clouds.png";
    }
  }

  static BoxDecoration getWeatherBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      border: Border.all(color: Colors.black38),
      boxShadow: Styles.itemShadow(),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue.shade200,
          Colors.blue.shade100,
        ],
      ),
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

  static Text blackWeatherLabel(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
