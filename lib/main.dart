import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/src/app.dart';

Future main() async {
  await dotenv.load(fileName: "lib/.env");
  runApp(const App());
}
