import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/current_weather/current_weather_info_box.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherModel model;

  const CurrentWeather({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              WeatherUtils.getWeatherIconPath(model.weatherType),
              scale: 1.4,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: "${model.temperature}",
                      style: const TextStyle(fontSize: 100)),
                  const TextSpan(
                      text: WeatherStrings.celsiusMark,
                      style: TextStyle(fontSize: 70)),
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
