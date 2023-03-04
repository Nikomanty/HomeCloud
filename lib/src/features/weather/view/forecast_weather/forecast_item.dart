import 'package:flutter/material.dart';
import 'package:home_cloud/src/constants/app_colors.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_strings.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';
import 'package:home_cloud/src/utils/date_format_utils.dart';

class ForecastItem extends StatelessWidget {
  final WeatherModel weatherModel;

  const ForecastItem({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textWidget(context, false,
                  DateFormatUtils.formattedDateddMM(weatherModel.dateTime)),
              _textWidget(context, false,
                  DateFormatUtils.formattedTimeHHmm(weatherModel.dateTime)),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.onPrimary.withOpacity(0.1),
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
                  _textWidget(context, false,
                      "${weatherModel.temperature} ${WeatherStrings.celsiusMark}"),
                  _textWidget(context, true,
                      "${weatherModel.feelsLike} ${WeatherStrings.celsiusMark}"),
                  _textWidget(context, false,
                      "${weatherModel.humidity} ${WeatherStrings.percentMark}"),
                  _textWidget(context, false,
                      "${weatherModel.windSpeed} ${WeatherStrings.speedMark}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWidget(BuildContext context, bool isGrayColor, String text) =>
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isGrayColor
                  ? AppColors.onPrimaryVariant
                  : AppColors.onPrimary),
        ),
      );
}
