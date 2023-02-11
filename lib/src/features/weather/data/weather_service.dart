import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:home_cloud/secrets.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> fetchCurrentWeather(http.Client client) async {
    final response = await client.get(Uri.parse(_getWeatherUrl("weather")));
    return compute(parseCurrentWeather, response.body);
  }

  static WeatherModel parseCurrentWeather(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return WeatherModel.fromJson(parsed as Map<String, dynamic>);
  }

  Future<List<WeatherModel>> fetchForecastWeather(http.Client client) async {
    final response = await client.get(Uri.parse(_getWeatherUrl("forecast")));
    return compute(parseForecastWeather, response.body);
  }

  static List<WeatherModel> parseForecastWeather(String responseBody) {
    List<dynamic> parsedList =
        jsonDecode(responseBody)['list'] as List<dynamic>;
    List<WeatherModel> weatherList = List<WeatherModel>.from(parsedList
        .map(
            (weather) => WeatherModel.fromJson(weather as Map<String, dynamic>))
        .toList());
    return weatherList;
  }

  static String _getWeatherUrl(String type) {
    const String latCoord = "64.944924";
    const String longCoord = "25.397997";
    return "https://api.openweathermap.org/data/2.5/$type?lat=$latCoord&lon=$longCoord&appid=$weatherApiKey&units=metric";
  }
}
