import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/screens/settings.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/widgets/weather_body.dart';
import '../../../../business_logic/weather/weather/weather_cubit.dart';
import 'widgets/search_weather.dart';

class WeatherAppCubit extends StatelessWidget {
  const WeatherAppCubit({Key? key}) : super(key: key);
  static const routeName = '/weather_app_cubit';

  void _fetchWeather(BuildContext context, String city) {
    context.read<WeatherCubit>().fetchWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp Bloc'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
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
      body: const WeatherBody(),
    );
  }
}
