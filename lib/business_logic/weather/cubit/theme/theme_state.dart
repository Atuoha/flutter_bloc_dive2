part of 'theme_cubit.dart';

@immutable
class WeatherThemeState extends Equatable {
  final AppTheme theme;

  const WeatherThemeState({required this.theme});

  factory WeatherThemeState.initial() =>
      const WeatherThemeState(theme: AppTheme.dark);

  @override
  List<Object?> get props => [theme];

  @override
  String toString() => 'WeatherThemeState{theme: $theme}';

  WeatherThemeState copyWith({
    AppTheme? theme,
  }) {
    return WeatherThemeState(
      theme: theme ?? this.theme,
    );
  }
}
