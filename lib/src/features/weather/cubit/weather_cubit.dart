import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../data/weather_repository_impl.dart';
import '../models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getData() async {
    try {
      WeatherModel currentData =
          await _weatherRepository.getCurrentWeatherData();
      List<dynamic> forecastData =
          await _weatherRepository.getForecastData();
      emit(WeatherLoaded(
        currentWeatherData: currentData,
        forecastData: forecastData,
      ));
    } on Exception {
      emit(WeatherError(errorMessage: "Couldn't fetch weather data"));
    }
  }
}
