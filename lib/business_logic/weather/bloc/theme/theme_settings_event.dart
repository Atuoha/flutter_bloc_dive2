part of 'theme_settings_bloc.dart';

class ThemeSettingsEvent extends Equatable {
  const ThemeSettingsEvent();

  @override
  List<Object?> get props => [];
}


class ToggleThemeEvent extends ThemeSettingsEvent{

}

class SwitchThemeByTempEvent extends ThemeSettingsEvent{
  final AppTheme theme;
  const SwitchThemeByTempEvent({required this.theme});

  @override
  List<Object?> get props => [theme];

  @override
  String toString() {
    return 'SwitchThemeByTempEvent{theme: $theme}';
  }
}