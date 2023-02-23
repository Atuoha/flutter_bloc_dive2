part of 'theme_settings_bloc.dart';

class ThemeSettingsState extends Equatable {
  final AppTheme theme;

  const ThemeSettingsState({required this.theme});

  factory ThemeSettingsState.initial() =>
      const ThemeSettingsState(theme: AppTheme.dark);

  @override
  List<Object?> get props => [theme];

  @override
  String toString() => 'ThemeSettingsState{theme: $theme}';

  ThemeSettingsState copyWith({
    AppTheme? theme,
  }) {
    return ThemeSettingsState(
      theme: theme ?? this.theme,
    );
  }
}
