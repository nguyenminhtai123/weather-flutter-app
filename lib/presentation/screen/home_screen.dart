import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/presentation/widgets/fade_in.dart';
import 'package:weather_app/presentation/widgets/hourly_forcast.dart';
import 'package:weather_app/presentation/widgets/main_weather.dart';
import 'package:weather_app/presentation/widgets/search_bar.dart';
import 'package:weather_app/presentation/widgets/weather_detail.dart';
import 'package:weather_app/presentation/widgets/weather_info.dart';
import 'package:weather_app/presentation/widgets/weekly_forecast.dart';

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
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
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
            _isLoading
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
                                child: MainWeather(),
                              ),
                              FadeIn(
                                child: WeatherInfo(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              FadeIn(
                                child: HourlyForecast(),
                              ),
                            ],
                          ),
                          onRefresh: () async {},
                        ),
                        ListView(
                          padding: const EdgeInsets.all(10),
                          children: const [
                            FadeIn(
                              child: WeeklyForecast(),
                            ),
                            FadeIn(
                              child: WeatherDetail(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
