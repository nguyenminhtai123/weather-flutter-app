import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  Widget _hourlyWidget(String hours, IconData icon, String temp) {
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
              Icon(
                icon,
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(
                width: 80,
                child: Text(
                  textAlign: TextAlign.center,
                  temp,
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
          children: [
            _hourlyWidget(
              '16:00',
              MdiIcons.weatherRainy,
              '13.4˚C',
            ),
            _hourlyWidget(
              '17:00',
              MdiIcons.weatherRainy,
              '13.4˚C',
            ),
            _hourlyWidget(
              '18:00',
              MdiIcons.weatherCloudy,
              '13.7˚C',
            ),
          ],
        ),
      ],
    );
  }
}
