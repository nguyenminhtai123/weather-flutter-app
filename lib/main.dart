import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/screen/home_screen.dart';
import 'package:weather_app/presentation/screen/hourly_weather_screen.dart';
import 'package:weather_app/presentation/screen/weekly_weather_screen.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.blue,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        home: const HomeScreen(),
        routes: {
          WeeklyWeatherScreen.routeName: (myCtx) => const WeeklyWeatherScreen(),
          HourlyWeatherScreen.routeName: (myCtx) => const HourlyWeatherScreen(),
        },
      ),
    );
  }
}
