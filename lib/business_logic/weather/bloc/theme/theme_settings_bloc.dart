import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/enums/apptheme.dart';
import '../weather/weather_bloc.dart';

part 'theme_settings_event.dart';

part 'theme_settings_state.dart';

class ThemeSettingsBloc extends Bloc<ThemeSettingsEvent, ThemeSettingsState> {
  final WeatherBloc weatherBloc;
  late StreamSubscription weatherSubscription;

  ThemeSettingsBloc({required this.weatherBloc})
      : super(ThemeSettingsState.initial()) {
    weatherSubscription =
        weatherBloc.stream.listen((WeatherState weatherState) {
      switchTempByTemp(weatherState.weather.temp);
    });

    on<SwitchThemeByTempEvent>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });

    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(
          theme:
              state.theme == AppTheme.light ? AppTheme.dark : AppTheme.light));
    });
  }

  void switchTempByTemp(temp) {
    if (temp > kMinMax) {
      add(const SwitchThemeByTempEvent(theme: AppTheme.light));
    } else {
      add(const SwitchThemeByTempEvent(theme: AppTheme.dark));
    }
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}
