import 'package:flutter/material.dart';
import 'package:home_cloud/features/weather/models/weather_model.dart';
import 'package:home_cloud/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/features/weather/view/utils/weather_utils.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherModel model;

  const CurrentWeather({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          WeatherUtils.getWeatherIconPath(model.weatherType),
          scale: 2,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: <TextSpan>[
              TextSpan(
                  text: "${model.temperature}",
                  style: const TextStyle(fontSize: 80)),
              const TextSpan(
                  text: WeatherStrings.celsiusMark,
                  style: TextStyle(fontSize: 60)),
            ],
          ),
        ),
      ],
    );
  }
}
