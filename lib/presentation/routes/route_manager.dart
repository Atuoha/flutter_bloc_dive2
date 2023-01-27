import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/homescreen.dart';
import '../screens/screen2.dart';

class RouteManager {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
