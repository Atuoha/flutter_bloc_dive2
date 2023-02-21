class WeatherException implements Exception {
  String? message;

  WeatherException([message = 'Something went wrong']) {
    message = 'Weather exception: $message';
  }

  @override
  String toString() => 'WeatherException{message: $message}';
}
