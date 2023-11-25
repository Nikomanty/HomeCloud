import 'package:home_cloud/core/converters/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final String weatherType;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int windSpeed;
  @DateTimeConverter()
  final DateTime dateTime;

  WeatherModel({
    required this.weatherType,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.dateTime,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherType: json['weather'][0]['main'] as String,
      temperature: json['main']['temp'].round() as int,
      feelsLike: json['main']['feels_like'].round() as int,
      humidity: json['main']['humidity'] as int,
      windSpeed: json['wind']['speed'].round() as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch((json['dt'] * 1000) as int),
    );
  }
}
