import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:home_cloud/src/features/weather/view/current_weather/current_weather.dart';
import 'package:home_cloud/src/features/weather/view/current_weather/update_weather_widget.dart';
import 'package:home_cloud/src/features/weather/view/forecast_weather/forecast_carousel.dart';
import 'package:home_cloud/src/features/weather/view/utils/weather_utils.dart';
import 'package:home_cloud/src/widgets/error/centered_error_text.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 30), (timer) {
      context.read<WeatherCubit>().updateData();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: WeatherUtils.getWeatherBoxDecoration(),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state.status == WeatherStatus.initial ||
                  state.status == WeatherStatus.update) {
                return const CenteredLoader();
              } else if (state.status == WeatherStatus.error) {
                return CenteredErrorText(
                  errorMessage: state.exception.toString(),
                );
              } else {
                WeatherModel? currentWeather = state.currentWeather;
                List<WeatherModel>? forecastWeather = state.forecastWeather;
                return _weatherContent(currentWeather!, forecastWeather!);
              }
            },
          ),
        ),
        UpdateWeatherWidget(),
      ],
    );
  }

  Widget _weatherContent(
    WeatherModel currentWeather,
    List<WeatherModel> forecastWeather,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CurrentWeather(model: currentWeather),
          ForecastCarousel(forecastData: forecastWeather),
        ],
      ),
    );
  }
}
