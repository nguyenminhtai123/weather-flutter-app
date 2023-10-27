import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  Widget _hourlyWidget(dynamic weather, BuildContext context) {
    final currentTime = weather.date;
    final hours = DateFormat.Hm().format(currentTime);

    return Container(
      height: 175,
      padding: const EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                textAlign: TextAlign.center,
                hours,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              MapString.mapStringToIcon(
                '${weather.condition}',
                50,
              ),
              SizedBox(
                width: 80,
                child: Text(
                  textAlign: TextAlign.center,
                  '${weather.dailyTemp.toStringAsFixed(1)}˚C',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Next 3 hours',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hourly_weather_wcreen');
                  },
                  child: const Text(
                    'See More',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weatherProv.hourlyWeather
                .map((item) => _hourlyWidget(item, context))
                .toList(),
          ),
        ],
      );
    });
  }
}
