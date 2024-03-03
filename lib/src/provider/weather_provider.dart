import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/src/models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  WeatherModels? _currentWeather;
  bool _isLoadingAnimation = false;

  WeatherModels? get currentWeather => _currentWeather;
  bool get isLoadingAnimation => _isLoadingAnimation;

  Future<void> fetchWeather(String cityName) async {
    try {
      _isLoadingAnimation = true;
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${dotenv.env["API_KEY_WEATHER"]}";

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _currentWeather = WeatherModels.fromJson(jsonData);
        notifyListeners();
      } else {
        throw Exception('Failed to load weather data.');
      }
    } catch (e) {
      print("Error PROVIDER: $e");
    } finally {
      _isLoadingAnimation = false;
    }
  }
}
