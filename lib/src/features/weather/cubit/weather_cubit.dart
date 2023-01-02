import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/src/features/weather/data/weather_repository_impl.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  Future<void> updateData() async {
    emit(state.copyWith(status: WeatherStatus.update));
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    try {
      WeatherModel currentData =
      await _weatherRepository.getCurrentWeatherData();
      List<dynamic> forecastData = await _weatherRepository.getForecastData();
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
