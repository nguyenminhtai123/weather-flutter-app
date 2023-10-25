import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  // Widget _dailyWidget(IconData icon, String header, String body) {
  //   return Container();
  // }

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '13.4˚C',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Raining',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Icon(
                        MdiIcons.weatherRainy,
                        size: 55,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Wed',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            MdiIcons.weatherSunny,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 45,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Wed',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            MdiIcons.weatherSunny,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 45,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Wed',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            MdiIcons.weatherSunny,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 45,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Wed',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            MdiIcons.weatherSunny,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 45,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Wed',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            MdiIcons.weatherSunny,
                            color: Colors.blue,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 45,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
