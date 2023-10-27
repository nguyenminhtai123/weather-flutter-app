// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/provider/weather_provider.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  Widget _weatherInfoBuilder({
    required String header,
    required String body,
    required IconData icon,
    double? iconSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: iconSize ?? 40,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                header,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                body,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProv, _) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _weatherInfoBuilder(
                  header: 'Precepitation',
                  body: '${weatherProv.dailyWeather!.precip}%',
                  icon: MdiIcons.weatherRainy,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 65,
                  child: const VerticalDivider(
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.black,
                  ),
                ),
                _weatherInfoBuilder(
                  header: 'UV index',
                  body: UvIndex.mapUviValueToString(uvi: weatherProv.dailyWeather!.uvi),
                  icon: MdiIcons.sunWireless,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
