import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/screens/settings.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/widgets/weather_body.dart';
import '../../../../business_logic/weather/weather/weather_cubit.dart';
import 'widgets/search_weather.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WeatherAppCubit extends StatefulWidget {
  const WeatherAppCubit({Key? key}) : super(key: key);
  static const routeName = '/weather_app_cubit';

  @override
  State<WeatherAppCubit> createState() => _WeatherAppCubitState();
}

class _WeatherAppCubitState extends State<WeatherAppCubit> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isInternetConnected = true;

  void _fetchWeather(BuildContext context, String city) {
    context.read<WeatherCubit>().fetchWeather(city);
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      setState(() {
        isInternetConnected = true;
      });
    } else {
      setState(() {
        isInternetConnected = false;
      });
    }
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
      bottomSheet: !isInternetConnected
          ? Container(
              height: 30,
              width: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Opps! There is no internet connection.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
