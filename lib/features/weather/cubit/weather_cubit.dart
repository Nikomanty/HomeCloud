import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/features/weather/data/weather_service.dart';
import 'package:home_cloud/features/weather/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService _weatherService;

  WeatherCubit(this._weatherService) : super(const WeatherState());

  Future<void> updateData() async {
    emit(state.copyWith(status: WeatherStatus.update));
    await getWeatherData();
  }

  Future<void> getWeatherData() async {
    try {
      WeatherModel currentData = await _weatherService.fetchCurrentWeather();
      List<WeatherModel> forecastData =
          await _weatherService.fetchForecastWeather();
      emit(state.copyWith(
        status: WeatherStatus.loaded,
        currentWeather: currentData,
        forecastWeather: forecastData,
      ));
    } on Exception catch (exception) {
      emit(state.copyWith(status: WeatherStatus.error, exception: exception));
    }
  }
}
