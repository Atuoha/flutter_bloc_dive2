part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final Weather weather;
  final WeatherStatus weatherStatus;
  final CustomError error;

  const WeatherState(
      {required this.weather,
      required this.weatherStatus,
      required this.error});

  factory WeatherState.initial() => WeatherState(
        weather: Weather.initial(),
        weatherStatus: WeatherStatus.initial,
        error: const CustomError(),
      );

  @override
  List<Object> get props => [weather, weatherStatus, error];

  @override
  String toString() =>
      'WeatherState{weather: $weather, weatherStatus: $weatherStatus, error: $error}';

  WeatherState copyWith(
      {Weather? weather, WeatherStatus? weatherStatus, CustomError? error}) {
    return WeatherState(
      weather: weather ?? this.weather,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      error: error ?? this.error,
    );
  }
}
