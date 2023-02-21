import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/repositories/weather_repository.dart';
import 'package:flutter_bloc_dive2/services/weather_api_services.dart';
import '../../../constants/enums/weather_status.dart';
import '../../../data/models/weather/custom_error.dart';
import '../../../data/models/weather/weather.dart';
import 'package:http/http.dart' as http;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future fetchWeather(String city) async {
    emit(state.copyWith(weatherStatus: WeatherStatus.loading));

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);
      emit(state.copyWith(
        weatherStatus: WeatherStatus.loaded,
        weather: weather,
      ));
      print(weather);
    } on CustomError catch (e) {
      emit(state.copyWith(
        weatherStatus: WeatherStatus.error,
        error: e,
      ));
    } catch (e) {
      rethrow;
    }
  }

  void _fetchWeather(String city) async {
    final weather = await WeatherRepository(
      weatherApiService: WeatherApiServices(
        httpClient: http.Client(),
      ),
    ).fetchWeather(city);

    emit(state.copyWith(weather: weather));
  }
}
