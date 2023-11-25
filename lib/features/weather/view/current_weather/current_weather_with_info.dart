import 'package:flutter/material.dart';
import 'package:home_cloud/features/weather/models/weather_model.dart';
import 'package:home_cloud/features/weather/view/current_weather/current_weather.dart';
import 'package:home_cloud/features/weather/view/current_weather/current_weather_info_box.dart';

class CurrentWeatherWithInfo extends StatelessWidget {
  final WeatherModel model;

  const CurrentWeatherWithInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CurrentWeather(model: model),
          CurrentWeatherInfoBox(
            feelsLike: model.feelsLike,
            humidity: model.humidity,
            windSpeed: model.windSpeed,
          ),
        ],
      ),
    );
  }
}
