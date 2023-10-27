// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/presentation/widgets/fade_in.dart';
import 'package:weather_app/presentation/widgets/hourly_forcast.dart';
import 'package:weather_app/presentation/widgets/main_weather.dart';
import 'package:weather_app/presentation/widgets/search_bar.dart';
import 'package:weather_app/presentation/widgets/weather_detail.dart';
import 'package:weather_app/presentation/widgets/weather_info.dart';
import 'package:weather_app/presentation/widgets/weekly_forecast.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData(context);
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(context, isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
          // if(weatherProv.isRequestError) return RequestError();
          // if(weatherProv.isLocationError) return LocationError();
          return Column(
            children: [
              const SearchBarWidget(),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 2,
                  effect: ExpandingDotsEffect(
                    activeDotColor: themeContext.primaryColor,
                    dotHeight: 6,
                    dotWidth: 6,
                  ),
                ),
              ),
              _isLoading || weatherProv.isLoading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: themeContext.primaryColor,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Expanded(
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: _pageController,
                        children: [
                          RefreshIndicator(
                            child: ListView(
                              padding: const EdgeInsets.all(15),
                              shrinkWrap: true,
                              children: [
                                FadeIn(
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 250),
                                  child: MainWeather(),
                                ),
                                const FadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  child: WeatherInfo(),
                                ),
                                const FadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 750),
                                  child: HourlyForecast(),
                                ),
                              ],
                            ),
                            onRefresh: () async => _refreshData(context),
                          ),
                          ListView(
                            padding: const EdgeInsets.all(10),
                            children: const [
                              FadeIn(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 250),
                                child: WeeklyForecast(),
                              ),
                              FadeIn(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 500),
                                child: WeatherDetail(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
