import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../constants/enums/apptheme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<CubitThemeState> {
  ThemeCubit() : super(CubitThemeState.initial());

  void changeTheme() {
    if (state.theme == AppTheme.light) {
      emit(state.copyWith(theme: AppTheme.dark));
    } else {
      emit(state.copyWith(theme: AppTheme.light));
    }
  }
}
