// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      weatherType: json['weatherType'] as String,
      temperature: json['temperature'] as int,
      feelsLike: json['feelsLike'] as int,
      humidity: json['humidity'] as int,
      windSpeed: json['windSpeed'] as int,
      dateTime: const DateTimeConverter().fromJson(json['dateTime'] as int),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'weatherType': instance.weatherType,
      'temperature': instance.temperature,
      'feelsLike': instance.feelsLike,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'dateTime': const DateTimeConverter().toJson(instance.dateTime),
    };
