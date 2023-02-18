import 'package:flutter/material.dart';
import 'components/search_weather.dart';

class WeatherAppCubit extends StatefulWidget {
  const WeatherAppCubit({Key? key}) : super(key: key);
  static const routeName = '/weather_app_cubit';

  @override
  State<WeatherAppCubit> createState() => _WeatherAppCubitState();
}

class _WeatherAppCubitState extends State<WeatherAppCubit> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp Bloc'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SearchWeather(),
        ),
      ),
    );
  }
}
