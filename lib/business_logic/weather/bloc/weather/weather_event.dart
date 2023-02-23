part of 'weather_bloc.dart';

@immutable
class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final Weather weather;
  final WeatherStatus status;
  final CustomError error;

  FetchWeatherEvent({required this.weather, required this.status, required this.error});

  @override
  List<Object?> get props => [weather];

  @override
  String toString() {
    return 'FetchWeatherEvent{weather: $weather}';
  }
}
