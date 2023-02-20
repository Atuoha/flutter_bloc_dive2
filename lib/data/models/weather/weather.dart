import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final double minTemp;
  final double maxTemp;
  final String icon;
  final double temp;
  final String name;
  final String country;
  final DateTime lastUpdated;

  const Weather({
    required this.description,
    required this.minTemp,
    required this.name,
    required this.icon,
    required this.country,
    required this.temp,
    required this.maxTemp,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final data = json['weather'][0];
    final main = json['main'][0];

    return Weather(
      description: data['description'],
      minTemp: main['min_temp'],
      name: '',
      icon: '',
      country: data['country'],
      temp: main['temp'],
      maxTemp: main['max_temp'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
        description: '',
        minTemp: 100,
        name: '',
        icon: '',
        country: '',
        temp: 100,
        maxTemp: 100,
        lastUpdated: DateTime.now(),
      );

  @override
  List<Object?> get props => [
        description,
        minTemp,
        name,
        icon,
        country,
        temp,
        maxTemp,
        lastUpdated,
      ];

  @override
  String toString() =>
      'Weather{description: $description, minTemp: $minTemp, maxTemp: $maxTemp, icon: $icon, temp: $temp, name: $name, country: $country, lastUpdated: $lastUpdated}';

  Weather copyWith({
    String? description,
    double? minTemp,
    double? maxTemp,
    String? icon,
    double? temp,
    String? name,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
