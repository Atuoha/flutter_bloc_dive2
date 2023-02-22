import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/business_logic/weather/weather/weather_cubit.dart';
import 'package:meta/meta.dart';
import '../../../constants/constants.dart';
import '../../../constants/enums/apptheme.dart';

part 'theme_state.dart';

class WeatherThemeCubit extends Cubit<WeatherThemeState> {
  final WeatherCubit weatherCubit;
  late StreamSubscription weatherSubscription;

  WeatherThemeCubit({required this.weatherCubit})
      : super(WeatherThemeState.initial()) {
    weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      if (weatherState.weather.temp > kMinMax) {
        emit(
          state.copyWith(
            theme: AppTheme.light,
          ),
        );
      } else {
        emit(
          state.copyWith(
            theme: AppTheme.dark,
          ),
        );
      }
    });
  }


  @override
  Future<void> close() {
   weatherSubscription.cancel();
    return super.close();
  }

void toggleTheme() {
  emit(
    state.copyWith(
      theme: state.theme == AppTheme.light ? AppTheme.dark : AppTheme.light,
    ),
  );
}
}
