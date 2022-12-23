import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/view/forecast_weather/forecast_icon_column_widget.dart';
import 'package:home_cloud/src/features/weather/view/forecast_weather/forecast_item.dart';

class ForecastCarousel extends StatefulWidget {
  final List<dynamic> forecastData;

  const ForecastCarousel({Key? key, required this.forecastData}) : super(key: key);

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