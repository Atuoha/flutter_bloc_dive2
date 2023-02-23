import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/weather/cubit/cubits.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settings_cubit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10,
        ),
        child: SwitchListTile(
          value: context.watch<TempSettingsCubit>().state.isCelsius,
          onChanged: (value) =>
              context.read<TempSettingsCubit>().switchTempUnit(),
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit (Default Celsius'),
        ),
      ),
    );
  }
}
