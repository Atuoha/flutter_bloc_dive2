import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_dive2/data/models/weather/custom_error.dart';
import 'package:flutter_bloc_dive2/data/models/weather/direct_geocoding.dart';
import 'package:flutter_bloc_dive2/exception/weather_exception.dart';
import 'package:flutter_bloc_dive2/services/weather_api_services.dart';

import '../data/models/weather/weather.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiService;

  WeatherRepository({required this.weatherApiService});

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiService.getDirectGeocoding(city);
      if (kDebugMode) {
        print(directGeocoding);
      }
      final Weather weather =
          await weatherApiService.getWeather(directGeocoding);
      if (kDebugMode) {
        print(weather);
      }
      // final Weather weather = tempWeather.copyWith(
      //     name: directGeocoding.name, country: directGeocoding.country);
      return weather;
    } on WeatherException catch (e) {
      print('Error From WEATHER');
      throw CustomError(errMsg: e.message.toString());
    } catch (e) {
      print('Error From Catch');
      print(e);
      throw CustomError(errMsg: e.toString());
    }
  }
}
