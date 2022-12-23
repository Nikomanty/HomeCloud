import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';

class CurrentWeatherInfoBox extends StatelessWidget {
  final int feelsLike;
  final int humidity;
  final int windSpeed;

  const CurrentWeatherInfoBox({
    Key? key,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _weatherInfoTile(
              WeatherStrings.feelsLike,
              "$feelsLike ${WeatherStrings.celsiusMark}",
            ),
            _weatherInfoTile(
              WeatherStrings.humidity,
              "$humidity ${WeatherStrings.percentMark}",
            ),
            _weatherInfoTile(
              WeatherStrings.windSpeed,
              "$windSpeed ${WeatherStrings.speedMark}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          _weatherSmallGrayLabel(title),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          WeatherUtils.blackWeatherLabel(value, 17),
        ],
      ),
    );
  }

  Widget _weatherSmallGrayLabel(String title) => Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black45,
          ),
        ),
      );
}
