import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/widgets/show_weather.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../business_logic/weather/weather/weather_cubit.dart';
import '../../../../../constants/enums/weather_status.dart';
import '../components/error_dialog.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({
    Key? key,
  }) : super(key: key);

  final double _kSize = 50;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(listener: (context, state) {
      if (state.weatherStatus == WeatherStatus.error) {
        errorDialog(context: context, errMsg: state.error.errMsg);
      }
    }, builder: (context, state) {
      switch (state.weatherStatus) {
        case WeatherStatus.initial:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimationWidget.flickr(
                  leftDotColor: Colors.blue,
                  rightDotColor: Colors.blue.withOpacity(0.5),
                  size: _kSize,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter city name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        case WeatherStatus.loading:
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.blue,
              size: _kSize,
            ),
          );

        case WeatherStatus.error:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/error3.gif'),
                const Text(
                  'Opps! An error occurred!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );

        case WeatherStatus.loaded:
          // This case is handled down 👇
          break;
      }

      // WeatherStatus.loaded
      return ShowWeather(weather: state.weather);
    });
  }
}
