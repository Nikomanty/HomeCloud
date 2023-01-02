import 'package:home_cloud/src/features/weather/data/weather_service.dart';
import 'package:home_cloud/src/features/weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService _service = WeatherService();

  @override
  Future<WeatherModel> getCurrentWeatherData() {
    return _service.fetchCurrentWeather(http.Client());
  }

  @override
  Future<List<dynamic>> getForecastData() {
    return _service.fetchForecastWeather(http.Client());
  }
}

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeatherData();
  Future<List<dynamic>> getForecastData();
}
