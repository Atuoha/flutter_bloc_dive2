import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/screens/settings.dart';
import 'package:flutter_bloc_dive2/services/weather_api_services.dart';
import '../../../../repositories/weather_repository.dart';
import 'components/search_weather.dart';
import 'package:http/http.dart' as http;

class WeatherAppCubit extends StatefulWidget {
  const WeatherAppCubit({Key? key}) : super(key: key);
  static const routeName = '/weather_app_cubit';

  @override
  State<WeatherAppCubit> createState() => _WeatherAppCubitState();
}

class _WeatherAppCubitState extends State<WeatherAppCubit> {
  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  // fetch Weather
  void _fetchWeather() {
    WeatherRepository(
      weatherApiService: WeatherApiServices(
        httpClient: http.Client(),
      ),
    ).fetchWeather('Owerri');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp Bloc'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SearchWeather(),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
