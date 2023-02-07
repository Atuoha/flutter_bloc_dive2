import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hyd_theme_event.dart';
part 'hyd_theme_state.dart';

class HydThemeBloc extends Bloc<HydThemeEvent, HydThemeState> {
  HydThemeBloc() : super(HydThemeInitial()) {
    on<HydThemeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
