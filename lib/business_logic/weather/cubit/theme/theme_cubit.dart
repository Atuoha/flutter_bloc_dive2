import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../weather/weather_cubit.dart';
import 'package:meta/meta.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/enums/apptheme.dart';

part 'theme_state.dart';

class WeatherThemeCubit extends Cubit<WeatherThemeState> {
  // final WeatherCubit weatherCubit;
  // late StreamSubscription weatherSubscription;

  // Using StreamSubscription
  // WeatherThemeCubit({required this.weatherCubit})
  //     : super(WeatherThemeState.initial()) {
  //   weatherSubscription =
  //       weatherCubit.stream.listen((WeatherState weatherState) {
  //     if (weatherState.weather.temp > kMinMax) {
  //       emit(
  //         state.copyWith(
  //           theme: AppTheme.light,
  //         ),
  //       );
  //     } else {
  //       emit(
  //         state.copyWith(
  //           theme: AppTheme.dark,
  //         ),
  //       );
  //     }
  //   });
  // }
  //
  // @override
  // Future<void> close() {
  //   weatherSubscription.cancel();
  //   return super.close();
  // }

  WeatherThemeCubit() : super(WeatherThemeState.initial());

  void changeTheme(currentTemp) {
    if (currentTemp > kMinMax) {
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
  }

  void toggleTheme() {
    emit(
      state.copyWith(
        theme: state.theme == AppTheme.light ? AppTheme.dark : AppTheme.light,
      ),
    );
  }
}
