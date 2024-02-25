import 'package:flutter/material.dart';
import 'package:weather_app/src/features/welcome/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 148, 64, 251),
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
      ),
      home: const WelcomePage(),
    );
  }
}
