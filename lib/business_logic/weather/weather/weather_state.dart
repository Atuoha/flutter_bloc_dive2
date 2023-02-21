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
        weather: Weather(
          description: '',
          minTemp: 0.0,
          name: '',
          icon: '',
          country: '',
          temp: 0.0,
          maxTemp: 0.0,
          lastUpdated: DateTime.now(),
        ),
        weatherStatus: WeatherStatus.initial,
        error: const CustomError(errMsg: ''),
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
