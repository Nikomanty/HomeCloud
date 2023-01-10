import 'package:flutter/material.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';

class ForecastItem extends StatelessWidget {
  final WeatherModel weatherModel;

  const ForecastItem({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textWidget(
                  DateFormatUtils.formattedDateddMM(weatherModel.dateTime)),
              _textWidget(
                  DateFormatUtils.formattedTimeHHmm(weatherModel.dateTime)),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    WeatherUtils.getWeatherIconPath(weatherModel.weatherType),
                    scale: 6,
                  ),
                  _textWidget(
                      "${weatherModel.temperature} ${WeatherStrings.celsiusMark}"),
                  _textWidget(
                      "${weatherModel.feelsLike} ${WeatherStrings.celsiusMark}"),
                  _textWidget(
                      "${weatherModel.humidity} ${WeatherStrings.percentMark}"),
                  _textWidget(
                      "${weatherModel.windSpeed} ${WeatherStrings.speedMark}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _textWidget(String text) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      );
}
