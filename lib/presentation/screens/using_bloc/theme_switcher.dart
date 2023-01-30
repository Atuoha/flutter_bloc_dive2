import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/bloc/theme/theme_bloc.dart';
import '../../../constants/enums/apptheme.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);
  static const routeName = '/theme_screen';

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final randomInt = Random().nextInt(20);
          context.read<ThemeBloc>().add(
                ChangeThemeEvent(),
              );
        },
        child: Icon(
          context.watch<ThemeBloc>().state.theme == AppTheme.dark
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
      ),
      body: const Center(
        child: Text(
          'Theme Switcher',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
