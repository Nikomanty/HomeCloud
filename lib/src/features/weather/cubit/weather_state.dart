part of 'weather_cubit.dart';

enum WeatherStatus { initial, update, loaded, error}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherModel? currentWeather;
  final List<WeatherModel>? forecastWeather;
  final Exception? exception;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.currentWeather,
    this.forecastWeather,
    this.exception,
  });

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherModel? currentWeather,
    List<WeatherModel>? forecastWeather,
    Exception? exception,
  }) {
    return WeatherState(
      status: status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
      forecastWeather: forecastWeather ?? this.forecastWeather,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props =>
      [status, currentWeather, forecastWeather, exception];
}
