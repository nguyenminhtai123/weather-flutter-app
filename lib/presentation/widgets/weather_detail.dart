import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({super.key});

  Widget _gridWeatherBuilder(IconData icon, String header, String body) {
    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 35,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    header,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    body,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    _gridWeatherBuilder(
                      MdiIcons.waterPercent,
                      '${weatherProv.weather!.humidity}',
                      'Humidity',
                    ),
                    _gridWeatherBuilder(
                      MdiIcons.weatherWindy,
                      '${weatherProv.weather!.windSpeed}',
                      'Wind',
                    ),
                    _gridWeatherBuilder(
                      MdiIcons.temperatureCelsius,
                      '${weatherProv.weather!.feelsLike.toStringAsFixed(1)}˚C',
                      'Feels like',
                    ),
                    _gridWeatherBuilder(
                      MdiIcons.arrowDownCircle,
                      '${weatherProv.weather!.pressure}',
                      'Pressure',
                    ),
                  ]),
            );
          })
        ],
      ),
    );
  }
}
