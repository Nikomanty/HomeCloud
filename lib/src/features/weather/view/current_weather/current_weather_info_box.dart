import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/app_colors.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';

class CurrentWeatherInfoBox extends StatelessWidget {
  final int feelsLike;
  final int humidity;
  final int windSpeed;

  const CurrentWeatherInfoBox({
    super.key,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.onPrimary.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _weatherInfoTile(
              context,
              WeatherStrings.feelsLike,
              "$feelsLike ${WeatherStrings.celsiusMark}",
            ),
            _weatherInfoTile(
              context,
              WeatherStrings.humidity,
              "$humidity ${WeatherStrings.percentMark}",
            ),
            _weatherInfoTile(
              context,
              WeatherStrings.windSpeed,
              "$windSpeed ${WeatherStrings.speedMark}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherInfoTile(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.onPrimaryVariant),
            ),
          ),
          Text(value, style: Theme.of(context).textTheme.bodyLarge)
        ],
      ),
    );
  }
}
