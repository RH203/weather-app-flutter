import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIconWidget extends StatelessWidget {
  final String iconCode;
  const WeatherIconWidget({super.key, required this.iconCode});
  @override
  Widget build(BuildContext context) {
    IconData iconData = WeatherIcons.na;

    switch (iconCode) {
      // day
      case '01d':
        iconData = WeatherIcons.day_sunny;
        break;
      case '02d':
        iconData = WeatherIcons.day_cloudy;
        break;
      case '03d':
        iconData = WeatherIcons.day_windy;
        break;
      case '04d':
        iconData = WeatherIcons.cloudy;
        break;
      case '09d':
        iconData = WeatherIcons.day_rain_wind;
        break;
      case '10d':
        iconData = WeatherIcons.day_rain;
        break;
      case '11d':
        iconData = WeatherIcons.day_thunderstorm;
        break;
      case '13d':
        iconData = WeatherIcons.snowflake_cold;
        break;
      case '50d':
        iconData = WeatherIcons.windy;
        break;
      // night
      case '01n':
        iconData = WeatherIcons.night_clear;
        break;
      case '02n':
        iconData = WeatherIcons.night_cloudy;
        break;
      case '03n':
        iconData = WeatherIcons.night_cloudy_windy;
        break;
      case '04n':
        iconData = WeatherIcons.cloudy;
        break;
      case '09n':
        iconData = WeatherIcons.night_rain_wind;
        break;
      case '1nd':
        iconData = WeatherIcons.night_rain;
        break;
      case '11n':
        iconData = WeatherIcons.night_thunderstorm;
        break;
      case '13n':
        iconData = WeatherIcons.snowflake_cold;
        break;
      case '50n':
        iconData = WeatherIcons.windy;
        break;
      default:
        iconData = WeatherIcons.na;
        break;
    }
    return Icon(
      iconData,
      size: 200,
    );
  }
}
