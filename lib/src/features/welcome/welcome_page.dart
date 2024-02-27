import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _selected = false;
  var _index = 0;
  var _imageWelcome = [
    "assets/images/fall-is-coming.jpg",
    "assets/images/waiting-rain.jpg",
    "assets/images/weather-concept.jpg"
  ];
  var _textWelcome = ["Welcome ", "Hello", "Weather App"];

  void _addAnimateImageAndTextWelcome() {
    setState(() {
      _index++;
      _selected = true;
    });
  }

  void _decrementAnimateImageAndTextWelcome() {
    setState(() {
      _index--;
      _selected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                _imageWelcome[_index],
                key: ValueKey<int>(_index),
                height: 350,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _textWelcome[_index],
                key: ValueKey<int>(_index),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Visibility(
                    visible: _index != 0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 20),
                      ),
                      onPressed: _decrementAnimateImageAndTextWelcome,
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(140, 20),
                    ),
                    onPressed: _addAnimateImageAndTextWelcome,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
