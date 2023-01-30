import 'package:flutter/material.dart';
import '../screens/homescreen.dart';
import '../screens/screen2.dart';
import '../screens/using_bloc/bloc_screen1.dart';
import '../screens/using_bloc/theme_switcher.dart';
import '../screens/using_cubit/cubit_screen1.dart';

class RouteManager {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BlocScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const BlocScreen(),
        );

      case CubitScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CubitScreen(),
        );


      case ThemeSwitcher.routeName:
        return MaterialPageRoute(
          builder: (context) => const ThemeSwitcher(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Screen2.routeName:
        return MaterialPageRoute(
          builder: (context) => const Screen2(),
        );
    }
    return null;
  }
}
