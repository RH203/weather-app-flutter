import 'package:flutter/material.dart';
import 'package:weather_app/src/common/card/information_weather_card.dart';
import 'package:weather_app/src/common/icon/weather_icon_widget.dart';
import 'package:weather_app/src/features/welcome/welcome_page.dart';
import 'package:weather_app/src/provider/weather_provider.dart';
import 'package:weather_app/src/utils/convert_time_unix.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _nameCity = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    _nameCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        var weatherData = weatherProvider.currentWeather;
        var _isLoadingOnTap = false;

        Widget _isLoadingAnimationSuccess() {
          return LoadingAnimationWidget.discreteCircle(
            color: const Color(0xffffffff),
            size: 40,
            secondRingColor: const Color(0xff7042EC),
            thirdRingColor: const Color(0xff6B3ABD),
          );
        }

        Widget _isLoadingAnimationFailed() {
          return SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
              title: "Oops...",
              message:
                  "City name is incorrect or incomplete. Correct it and try again.",
              contentType: ContentType.failure,
            ),
          );
        }

        void _searchWeather() {
          setState(() {
            _isLoadingOnTap = true;
          });

          _focusNode.requestFocus();
          Provider.of<WeatherProvider>(context, listen: false)
              .fetchWeather(_nameCity.text);
        }

        Future.delayed(new Duration(seconds: 4), () {
          setState(() {
            _isLoadingOnTap = false;
          });
        });

        return ModalProgressHUD(
          inAsyncCall: _isLoadingOnTap,
          progressIndicator: _isLoadingAnimationSuccess(),
          child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SizedBox(
                        width: 380,
                        child: TextField(
                          controller: _nameCity,
                          focusNode: _focusNode,
                          onEditingComplete: _searchWeather,
                          decoration: InputDecoration(
                            hintText: weatherData?.nameCity ?? "Search",
                            suffixIcon: IconButton(
                              onPressed: _searchWeather,
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
                      child: Visibility(
                        visible: weatherData?.nameCity == null ? false : true,
                        child: Text(
                          weatherData?.nameCity ?? "N/A",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: const Color(0xffFCFCFD),
                              ),
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
                              Visibility(
                                visible:
                                    weatherData?.main == null ? false : true,
                                replacement: Text(
                                  "Data not found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color(0xffFCFCFD),
                                        fontSize: 30,
                                      ),
                                ),
                                child: Text(
                                  weatherData?.main ?? "N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: const Color(0xffFCFCFD),
                                        fontSize: 30,
                                      ),
                                ),
                              ),
                              Visibility(
                                visible: weatherData?.description == null
                                    ? false
                                    : true,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    weatherData?.description ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: const Color.fromARGB(
                                              255, 212, 212, 216),
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible:
                                weatherData?.nameCity == null ? false : true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WeatherIconWidget(
                                    iconCode: weatherData?.icon ?? "N/A"),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          ((weatherData?.temp ?? 0 - 32) *
                                                  5 /
                                                  9)
                                              .toStringAsFixed(1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                color: const Color(0xffFCFCFD),
                                                fontSize: 35,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              right: 0, bottom: 25),
                                          child: Icon(
                                            WeatherIcons.celsius,
                                            size: 60,
                                            color: Color.fromARGB(
                                                255, 212, 212, 216),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          weatherData?.humidity
                                                  .toStringAsFixed(1) ??
                                              "N/A",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                color: const Color(0xffFCFCFD),
                                                fontSize: 35,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 25),
                                          child: Icon(
                                            WeatherIcons.humidity,
                                            size: 40,
                                            color: Color.fromARGB(
                                                255, 212, 212, 216),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 8, right: 8),
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
                          child: CustomScrollView(
                            slivers: [
                              const SliverPadding(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InformationWeatherCard(
                                          title: "Temp Min",
                                          mainContent: ((weatherData?.tempMin ??
                                                      0 - 32) *
                                                  5 /
                                                  9)
                                              .toStringAsFixed(1),
                                          icon: const Icon(
                                            Icons.arrow_upward,
                                            size: 30,
                                          ),
                                        ),
                                        InformationWeatherCard(
                                          title: "Temp Max",
                                          mainContent: ((weatherData?.tempMax ??
                                                      0 - 32) *
                                                  5 /
                                                  9)
                                              .toStringAsFixed(1),
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InformationWeatherCard(
                                          title: "Wind",
                                          mainContent:
                                              weatherData?.wind.toString() ??
                                                  "N/A",
                                          icon: const Icon(
                                            WeatherIcons.windy,
                                            size: 30,
                                          ),
                                        ),
                                        InformationWeatherCard(
                                          title: "Deg",
                                          mainContent:
                                              weatherData?.deg.toString() ??
                                                  "N/A",
                                          icon: const Icon(
                                            WeatherIcons.wind_direction,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InformationWeatherCard(
                                          title: "Sunrise",
                                          mainContent: ConvertTimeUnix(
                                                  unixTimeStamp:
                                                      weatherData?.sunrise ?? 0)
                                              .getSunriseTime(),
                                          icon: const Icon(
                                            WeatherIcons.windy,
                                            size: 30,
                                          ),
                                        ),
                                        InformationWeatherCard(
                                          title: "Sunset",
                                          mainContent: ConvertTimeUnix(
                                                  unixTimeStamp:
                                                      weatherData?.sunset ?? 0)
                                              .getSunsetTime(),
                                          icon: const Icon(
                                            WeatherIcons.wind_direction,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    )
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
          ),
        );
      },
    );
  }
}
