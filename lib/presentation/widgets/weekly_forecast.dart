// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/provider/weather_provider.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  Widget _dailyWidget(DailyWeather dailyweather) {
    final dayOfWeek = DateFormat('EEE').format(dailyweather.date!);
    return Container(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              dayOfWeek,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MapString.mapStringToIcon(
              '${dailyweather.condition}',
              35,
            ),
          ),
          Text(
            '${dailyweather.condition}',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Next 7 Days',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 5,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child:
                  Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                return Column(
                  children: [
                    Consumer<WeatherProvider>(
                      builder: (context, weatherProv, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${weatherProv.weather!.temp.toStringAsFixed(1)}˚C',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // Text(
                                //   '${weatherProv.weather!.description}',
                                //   style: const TextStyle(
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // )
                                MapString.mapInputToWeather(
                                  context,
                                  '${weatherProv.weather!.currently}',
                                )
                              ],
                            ),
                            MapString.mapStringToIcon(
                              '${weatherProv.weather!.currently}',
                              65,
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: weatherProv.weeklyForecast.length,
                        itemBuilder: (context, index) {
                          DailyWeather dailyWeather =
                              weatherProv.weeklyForecast[index];
                          return _dailyWidget(dailyWeather);
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
