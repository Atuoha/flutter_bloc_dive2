import 'package:equatable/equatable.dart';

class DirectoryGeocoding extends Equatable {
  final String name;
  final String lat;
  final String lot;
  final String country;

  const DirectoryGeocoding({
    required this.name,
    required this.lat,
    required this.lot,
    required this.country,
  });

  factory DirectoryGeocoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];

    return DirectoryGeocoding(
        name: data['name'],
        lat: data['lat'],
        lot: data['lot'],
        country: data['country']);
  }

  @override
  String toString() =>
      'DirectoryGeometry{name: $name, lat: $lat, lot: $lot, country: $country}';

  @override
  List<Object?> get props => [name, lat, lot, country];
}
