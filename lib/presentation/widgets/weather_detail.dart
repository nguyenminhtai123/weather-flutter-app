import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              children: [
                FittedBox(
                  child: Text(
                    header,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    body,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GridView(
                padding: EdgeInsets.symmetric(vertical: 20),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  _gridWeatherBuilder(MdiIcons.waterPercent, '87%', 'Humidity'),
                  _gridWeatherBuilder(MdiIcons.waterPercent, '87%', 'Humidity'),
                  _gridWeatherBuilder(MdiIcons.waterPercent, '87%', 'Humidity'),
                  _gridWeatherBuilder(MdiIcons.waterPercent, '87%', 'Humidity'),
                ]),
          )
        ],
      ),
    );
  }
}
