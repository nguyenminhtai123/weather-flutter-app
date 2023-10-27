import 'package:flutter/material.dart';

class DailyWeather with ChangeNotifier {
  final dynamic dailyTemp;
  final String? condition;
  final String? description;
  final DateTime? date;
  final String? precip;
  final double? uvi;

  DailyWeather({
    this.dailyTemp,
    this.condition,
    this.description,
    this.date,
    this.precip,
    this.uvi,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    final precipData = json['daily']?[0]['pop'];
    if (precipData is num) {
      final calcPrecip = precipData * 100;
      final precipitation = calcPrecip.toStringAsFixed(0);
      return DailyWeather(
        precip: precipitation,
        uvi: json['daily']?[0]['uvi'],
      );
    } else {
      throw const FormatException('Invalid or missing pop data');
    }
  }

  static DailyWeather fromDailyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['temp']['day'],
      condition: json['weather']?[0]['main'],
      description: json['weather']?[0]['description'],
      date: DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000,
          isUtc: true),
    );
  }

  static DailyWeather fromHourlyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['temp'],
      condition: json['weather']?[0]['main'],
      description: json['weather']?[0]['description'],
      date: DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000),
    );
  }
}
