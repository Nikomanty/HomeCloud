import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/current_weather/current_weather_info_box.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherModel model;

  const CurrentWeather({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              WeatherUtils.getWeatherIconPath(model.weatherType),
              scale: 1.5,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  WeatherUtils.blackWeatherLabel(
                      "${model.temperature}", 100),
                  WeatherUtils.blackWeatherLabel(
                      WeatherStrings.celsiusMark, 70),
                ],
              ),
            ),
          ],
        ),
        CurrentWeatherInfoBox(
          feelsLike: model.feelsLike,
          humidity: model.humidity,
          windSpeed: model.windSpeed,
        ),
      ],
    );
  }
}
