import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/common/icon/weather_icon_widget.dart';
import 'package:weather_app/src/models/weather_models.dart';
import 'package:weather_app/src/provider/weather_provider.dart';

class InformationWeatherCard extends StatefulWidget {
  const InformationWeatherCard(
      {super.key,
      required this.title,
      required this.mainContent,
      required this.icon});

  final String title, mainContent;
  final Widget icon;

  @override
  State<InformationWeatherCard> createState() => _InformationWeatherCardState();
}

class _InformationWeatherCardState extends State<InformationWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, _) {
        var weatherData = weatherProvider.currentWeather;
        return Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 120,
          padding: const EdgeInsets.all(8),
          child: Card(
            elevation: 3.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Visibility(
                visible: weatherData?.nameCity == null ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    widget.icon,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          widget.mainContent,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    )
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
