class WeatherModels {
  final String main, description, icon, nameCity;
  final double temp, tempMin, tempMax, wind;
  final int deg, sunrise, sunset, responStatus, humidity;

  WeatherModels({
    required this.main,
    required this.nameCity,
    required this.description,
    required this.icon,
    required this.responStatus,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.wind,
    required this.deg,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModels.fromJson(Map<String, dynamic> json) {
    return WeatherModels(
      main: json['weather'][0]['main'],
      nameCity: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      responStatus: json['cod'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      deg: json['wind']['deg'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
