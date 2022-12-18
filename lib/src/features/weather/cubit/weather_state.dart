part of 'weather_cubit.dart';

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<dynamic> forecastData;
  final WeatherModel currentWeatherData;

  WeatherLoaded({required this.currentWeatherData, required this.forecastData});
}

class WeatherError extends WeatherState {
  final String errorMessage;
  WeatherError({required this.errorMessage});
}

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}
