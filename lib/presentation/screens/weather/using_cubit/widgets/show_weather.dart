import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../../../../business_logic/weather/temp_settings/temp_settings_cubit.dart';
import '../../../../../data/models/weather/weather.dart';

class ShowWeather extends StatelessWidget {
  const ShowWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather weather;

  final double _kSize = 50;

  String formatTemp(double temp, BuildContext context) {
    return context.watch<TempSettingsCubit>().state.isCelsius
        ? '${temp.toStringAsFixed(2)}°C'
        : '${((temp * 9 /5) + 32).toStringAsFixed(2)}°F';
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
              formatTemp(weather.temp, context),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(formatTemp(weather.minTemp, context)),
                const SizedBox(height: 5),
                Text(formatTemp(weather.maxTemp, context)),
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
