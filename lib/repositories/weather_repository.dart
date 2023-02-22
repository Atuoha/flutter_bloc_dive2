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

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message ?? 'Can not find $city');
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
