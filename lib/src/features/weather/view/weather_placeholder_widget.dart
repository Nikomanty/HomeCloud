import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cloud/src/features/weather/cubit/weather_cubit.dart';
import 'package:home_cloud/src/widgets/loading/centered_loader.dart';

import '../models/weather_model.dart';


//TODO: This widget should be removed when real weather box is implemented
class WeatherPlaceholderView extends StatefulWidget {
  const WeatherPlaceholderView({Key? key}) : super(key: key);

  @override
  State<WeatherPlaceholderView> createState() =>
      _WeatherPlaceholderViewState();
}

class _WeatherPlaceholderViewState
    extends State<WeatherPlaceholderView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              context.read<WeatherCubit>().getData();
              return const CenteredLoader();
            } else if (state is WeatherLoaded) {
              WeatherModel currentWeather = state.currentWeatherData;
              List<dynamic> forecastWeather = state.forecastData;
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("temperature: ${currentWeather.temperature}"),
                      Text("feelsLike: ${currentWeather.feelsLike}"),
                      Text("humidity: ${currentWeather.humidity}"),
                      Text("windSpeed: ${currentWeather.windSpeed}"),
                      Text("dateTime: ${currentWeather.dateTime}"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("temperature: ${forecastWeather[0].temperature}"),
                      Text("feelsLike: ${forecastWeather[0].feelsLike}"),
                      Text("humidity: ${forecastWeather[0].humidity}"),
                      Text("windSpeed: ${forecastWeather[0].windSpeed}"),
                      Text("dateTime: ${forecastWeather[0].dateTime}"),
                    ],
                  ),
                ],
              );
            } else {
              return const CenteredLoader();
            }
          },
        ),
      );
  }
}
