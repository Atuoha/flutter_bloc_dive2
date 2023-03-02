import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'hyd_theme_event.dart';

part 'hyd_theme_state.dart';

class HydThemeBloc extends Bloc<HydThemeEvent, HydThemeState>
    with HydratedMixin {
  HydThemeBloc() : super(HydThemeState.initial()) {
    on<ToggleThemeEvent>((event, emit) {
      emit(
        state.copyWith(
          theme:
              state.theme == AppThemed.light ? AppThemed.dark : AppThemed.light,
        ),
      );
    });
  }

  @override
  HydThemeState? fromJson(Map<String, dynamic> json) {
    print('Theme from storage: $json');
    final themeState = HydThemeState.fromJson(json);
    print('ThemeState: $themeState');
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(HydThemeState state) {
    print('ThemeState from storage: $state');
    final themeJson = state.toJson();
    print('ThemeState: $themeJson');
    return themeJson;
  }
}

