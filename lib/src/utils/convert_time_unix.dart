import 'dart:core';

class ConvertTimeUnix {
  final int unixTimeStamp;

  ConvertTimeUnix({
    required this.unixTimeStamp,
  });

  String getSunriseTime() {
    DateTime sunriseDateTime = convertTimeUnixToDateTime(unixTimeStamp);
    return '${sunriseDateTime.hour.toString().padLeft(2, '0')}:${sunriseDateTime.minute.toString().padLeft(2, '0')}';
  }

  String getSunsetTime() {
    DateTime sunsetDateTime = convertTimeUnixToDateTime(unixTimeStamp);
    return '${sunsetDateTime.hour.toString().padLeft(2, '0')}:${sunsetDateTime.minute.toString().padLeft(2, '0')}';
  }

  DateTime convertTimeUnixToDateTime(int unixTimeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
  }
}
