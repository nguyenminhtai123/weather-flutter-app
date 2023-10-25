import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider with ChangeNotifier {
  String apiKey = '2d470c18125dc35a2dd334e7b1a682d8';
  LatLng? currentLocation;
  Weather? weather;
  DailyWeather? currentWeather = DailyWeather();
  List<DailyWeather> hourlyWeather = [];
  List<DailyWeather> hourly24Weather = [];
  List<DailyWeather> fiveDayWeather = [];
  List<DailyWeather> sevenDayWeather = [];
  bool isLoading = false;
  bool isLocationError = false;
  bool serviceEnabled = false;
  LocationPermission? permission;
}
