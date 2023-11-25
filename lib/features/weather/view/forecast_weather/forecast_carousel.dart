import 'package:flutter/material.dart';
import 'package:home_cloud/features/weather/models/weather_model.dart';
import 'package:home_cloud/features/weather/view/forecast_weather/forecast_icon_column.dart';
import 'package:home_cloud/features/weather/view/forecast_weather/forecast_item.dart';

class ForecastCarousel extends StatelessWidget {
  final List<WeatherModel> forecastData;

  const ForecastCarousel({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const ForecastIconColumn(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecastData.length,
              itemBuilder: (context, index) {
                return ForecastItem(weatherModel: forecastData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
