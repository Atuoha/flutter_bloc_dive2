import 'package:flutter/material.dart';

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
          value: true,
          onChanged: (value) {},
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celsius/Fahrenheit (Default Celsius'),
        ),
      ),
    );
  }
}
