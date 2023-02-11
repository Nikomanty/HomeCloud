import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/forecast_weather/forecast_icon_column_widget.dart';
import 'package:home_cloud/src/features/weather/view/forecast_weather/forecast_item.dart';

class ForecastCarousel extends StatefulWidget {
  final List<WeatherModel> forecastData;

  const ForecastCarousel({super.key, required this.forecastData});

  @override
  State<ForecastCarousel> createState() => _ForecastCarouselState();
}

class _ForecastCarouselState extends State<ForecastCarousel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const ForecastIconColumnWidget(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.forecastData.length,
                itemBuilder: (context, index) {
                  return ForecastItem(weatherModel: widget.forecastData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}