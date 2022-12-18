class WeatherModel {
  final String weatherType;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int windSpeed;
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
      weatherType: json['weather'][0]['main'],
      temperature: json['main']['temp'].round(),
      feelsLike: json['main']['feels_like'].round(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].round(),
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}