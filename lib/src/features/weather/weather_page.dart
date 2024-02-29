import 'package:flutter/material.dart';
import 'package:weather_app/src/common/card/information_weather_card.dart';
import 'package:weather_app/src/features/welcome/welcome_page.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var _nameCity;

  void _onTapBottomNavigationBar() {
    setState(() {});
  }

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
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
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
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Rain Rainn",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: const Color(0xffFCFCFD),
                                    fontSize: 45,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "Hujan deras",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color:
                                      const Color.fromARGB(255, 212, 212, 216),
                                  fontSize: 20,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/images/cloudy-sample.png",
                          width: 200,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "200",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color(0xffFCFCFD),
                                        fontSize: 49,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 0, bottom: 25),
                                  child: Icon(
                                    WeatherIcons.celsius,
                                    size: 70,
                                    color: Color.fromARGB(255, 212, 212, 216),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "200",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color(0xffFCFCFD),
                                        fontSize: 49,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 25),
                                  child: Icon(
                                    WeatherIcons.humidity,
                                    size: 50,
                                    color: Color.fromARGB(255, 212, 212, 216),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17, left: 8, right: 8),
                  child: Container(
                    width: double.infinity,
                    height: double.minPositive,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: const CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 7,
                            right: 7,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InformationWeatherCard(),
                                  InformationWeatherCard()
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InformationWeatherCard(),
                                  InformationWeatherCard()
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InformationWeatherCard(),
                                  InformationWeatherCard()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
