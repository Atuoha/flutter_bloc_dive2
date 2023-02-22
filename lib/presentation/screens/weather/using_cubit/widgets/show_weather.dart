import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:recase/recase.dart';

import '../../../../../data/models/weather/weather.dart';

class ShowWeather extends StatelessWidget {
  const ShowWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather weather;

  final double _kSize = 50;

  String formatTemp(double temp) {
    return '${temp.toStringAsFixed(2)}°C';
  }

  FadeInImage loadWeatherIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading1.gif',
      placeholderScale: 5,
      image: 'http://openweathermap.org/img/wn/$icon@2x.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                weather.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Text(weather.country)
          ],
        ),
        const SizedBox(height: 10),
        Text(
          TimeOfDay.fromDateTime(weather.lastUpdated).format(context),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTemp(weather.temp),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(formatTemp(weather.minTemp)),
                const SizedBox(height: 5),
                Text(formatTemp(weather.maxTemp)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          loadWeatherIcon(weather.icon),
          const SizedBox(width: 20),
          Text(
            weather.description.titleCase,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ])
      ],
    );
  }
}
