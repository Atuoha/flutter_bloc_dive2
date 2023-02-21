import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/screens/settings.dart';
import 'package:flutter_bloc_dive2/services/weather_api_services.dart';
import '../../../../business_logic/weather/weather/weather_cubit.dart';
import '../../../../repositories/weather_repository.dart';
import 'components/search_weather.dart';

class WeatherAppCubit extends StatefulWidget {
  const WeatherAppCubit({Key? key}) : super(key: key);
  static const routeName = '/weather_app_cubit';

  @override
  State<WeatherAppCubit> createState() => _WeatherAppCubitState();
}

class _WeatherAppCubitState extends State<WeatherAppCubit> {
  void _fetchWeather(String city) {
    context.read<WeatherCubit>().fetchWeather(city);
  }

  // @override
  // void initState() {
  //   _fetchWeather();
  //   super.initState();
  // }
  //
  // // fetch Weather
  // void _fetchWeather() {
  //   WeatherRepository(
  //     weatherApiService: WeatherApiServices(
  //       httpClient: http.Client(),
  //     ),
  //   ).fetchWeather('Owerri');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp Bloc'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SearchWeather(
              fetchWeather: _fetchWeather,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SettingsScreen.routeName),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Center());
  }
}
