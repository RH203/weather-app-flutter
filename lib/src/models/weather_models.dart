class WeatherModels {
  final String main, description, icon, responStatus;
  final double temp, tempMin, tempMax, humidity;

  WeatherModels(
      {required this.main,
      required this.description,
      required this.icon,
      required this.responStatus,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.humidity});

  factory WeatherModels.fromJson(Map<String, dynamic> json) {
    return WeatherModels(
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon'],
        responStatus: json['cod'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        humidity: json['main']['humidity']);
  }
}
