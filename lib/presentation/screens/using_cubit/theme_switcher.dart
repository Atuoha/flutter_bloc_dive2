// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/theme/theme_bloc.dart';
import '../../../business_logic/cubits/theme/theme_cubit.dart';
import '../../../constants/enums/apptheme.dart';

class CubitThemeSwitcher extends StatefulWidget {
  const CubitThemeSwitcher({Key? key}) : super(key: key);
  static const routeName = '/theme_screen_cubit';

  @override
  State<CubitThemeSwitcher> createState() => _CubitThemeSwitcherState();
}

class _CubitThemeSwitcherState extends State<CubitThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Theme Changer')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final randomInt = Random().nextInt(20);
          context.read<ThemeCubit>().changeTheme();
        },
        child: Icon(
          context.watch<ThemeCubit>().state.theme == AppTheme.dark
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
