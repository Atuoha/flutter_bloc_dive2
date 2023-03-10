// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/theme/theme_bloc.dart';
import '../../../constants/enums/apptheme.dart';

class BlocThemeSwitcher extends StatefulWidget {
  const BlocThemeSwitcher({Key? key}) : super(key: key);
  static const routeName = '/theme_screen_bloc';

  @override
  State<BlocThemeSwitcher> createState() => _BlocThemeSwitcherState();
}

class _BlocThemeSwitcherState extends State<BlocThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Theme Changer')),
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
