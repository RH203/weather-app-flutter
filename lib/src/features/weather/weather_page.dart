import 'package:flutter/material.dart';
import 'package:weather_app/src/features/welcome/welcome_page.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:ui' as ui;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var _nameCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffFCFCFD),
          ),
          onPressed: () => Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Weather App",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: const Color(0xffFCFCFD),
              ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff7042EC),
              Color(0xff6B3ABD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: 380,
                  child: TextField(
                    controller: _nameCity,
                    decoration: InputDecoration(
                      hintText: "Indonesia",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: const Color(0xffFCFCFD),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "CIty Name",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: const Color(0xffFCFCFD),
                      ),
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                  child: SizedBox(
                    width: 380,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "18 ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: const Color(0xffFCFCFD),
                                      fontSize: 80,
                                    ),
                              ),
                              Image.asset(
                                "assets/images/cloudy-sample.png",
                                width: 180,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Wind",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 220, 214, 214),
                                        fontSize: 20,
                                      ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Icon(
                                    Icons.waves,
                                    color: Color(0xffFCFCFD),
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "10",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: const Color(0xffFCFCFD),
                                    fontSize: 40,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Humidity",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 220, 214, 214),
                                        fontSize: 20,
                                      ),
                                ),
                                const BoxedIcon(
                                  WeatherIcons.humidity,
                                  color: Color(0xffFCFCFD),
                                  size: 35,
                                ),
                              ],
                            ),
                            Text(
                              "200",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: const Color(0xffFCFCFD),
                                    fontSize: 40,
                                  ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
