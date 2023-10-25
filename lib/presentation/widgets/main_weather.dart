// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/provider/weather_provider.dart';

class MainWeather extends StatelessWidget {
  MainWeather({super.key});

  final TextStyle _style1 = const TextStyle(
    fontWeight: FontWeight.w500,
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
                  'Mountain View',
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
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MapString.mapStringToIcon(
                  'Rain',
                  55,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  '13˚C',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '15˚/11˚ Feels like 13˚',
              style: _style1.copyWith(
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Light rain˚',
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
