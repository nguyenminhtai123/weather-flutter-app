// ignore_for_file: unused_field, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/provider/weather_provider.dart';

class MainWeather extends StatelessWidget {
  MainWeather({super.key});

  final TextStyle _style1 = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  final TextStyle _style2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.grey[700],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, WeatherProv, _) {
      return Container(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined),
                Text(
                  '${WeatherProv.weather!.cityName}',
                  style: _style1,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Text(
              DateFormat.yMMMEd().add_jm().format(DateTime.now()),
              style: _style2,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MapString.mapStringToIcon(
                  '${WeatherProv.weather!.currently}',
                  55,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '${WeatherProv.weather!.temp.toStringAsFixed(0)}˚C',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${WeatherProv.weather!.tempMax.toStringAsFixed(0)}˚/${WeatherProv.weather!.tempMin.toStringAsFixed(0)}˚ Feels like ${WeatherProv.weather!.feelsLike.toStringAsFixed(0)}˚',
              style: _style1.copyWith(
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              toBeginningOfSentenceCase(
                      '${WeatherProv.weather!.description}') ??
                  '',
              style: _style1.copyWith(
                fontSize: 19,
              ),
            ),
          ],
        ),
      );
    });
  }
}
