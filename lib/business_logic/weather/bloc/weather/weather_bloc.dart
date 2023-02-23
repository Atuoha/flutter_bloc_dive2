import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../constants/enums/weather_status.dart';
import '../../../../data/models/weather/custom_error.dart';
import '../../../../data/models/weather/weather.dart';
import '../../../../repositories/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository})
      : super(WeatherState.initial()) {
    on<FetchWeatherEvent>((event, emit) {
      emit(state.copyWith(
          weather: event.weather,
          weatherStatus: event.status,
          error: event.error));
    });
  }

  Future fetchWeather(String city) async {
    add(
      FetchWeatherEvent(
        weather: Weather.initial(),
        status: WeatherStatus.loading,
        error: const CustomError(),
      ),
    );

    try {
      Weather weather = await weatherRepository.fetchWeather(city);
      add(
        FetchWeatherEvent(
          weather: weather,
          status: WeatherStatus.loaded,
          error: const CustomError(),
        ),
      );
    } on CustomError catch (e) {
      add(
        FetchWeatherEvent(
          weather: Weather.initial(),
          status: WeatherStatus.error,
          error: e,
        ),
      );
    }
  }
}
