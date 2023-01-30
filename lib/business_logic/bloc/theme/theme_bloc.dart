import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../constants/enums/apptheme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (state.theme == AppTheme.light) {
        emit(state.copyWith(theme: AppTheme.dark));

      } else {
        emit(state.copyWith(theme: AppTheme.light));
      }
    });
  }
}
