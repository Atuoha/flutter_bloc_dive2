import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/weather/bloc/temp_settings/temp_settings_bloc.dart';

class SettingsScreenBloc extends StatelessWidget {
  const SettingsScreenBloc({Key? key}) : super(key: key);
  static const routeName = '/settings_bloc';

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
          value: context.watch<TempSettingsBloc>().state.isCelsius,
          onChanged: (value) =>
              context.read<TempSettingsBloc>().add(ToggleTempSettingsEvent()),
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit (Default Celsius'),
        ),
      ),
    );
  }
}
