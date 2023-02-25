import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/using_cubit/screens/forgot_password.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/using_cubit/screens/retrieve_password.dart';
import 'package:flutter_bloc_dive2/presentation/screens/hydrated_bloc/counter_app.dart';
import 'package:flutter_bloc_dive2/presentation/screens/weather/using_cubit/weather_app.dart';
import '../screens/authentication/using_cubit/auth_entry_cubit.dart';
import '../screens/authentication/using_cubit/screens/auth.dart';
import '../screens/event_transformer/event_transformer.dart';
import '../screens/homescreen.dart';
import '../screens/screen2.dart';
import '../screens/todo/using_bloc/todo.dart';
import '../screens/todo/using_cubit/todo.dart';
import '../screens/using_bloc/bloc_access.dart';
import '../screens/using_bloc/bloc_relationship.dart';
import '../screens/using_bloc/bloc_screen1.dart';
import '../screens/using_bloc/theme_switcher.dart';
import '../screens/using_cubit/cubit_relationship.dart';
import '../screens/using_cubit/cubit_screen1.dart';
import '../screens/using_cubit/theme_switcher.dart';
import '../screens/weather/using_bloc/screens/settings.dart';
import '../screens/weather/using_bloc/weather_app.dart';
import '../screens/weather/using_cubit/screens/settings.dart';

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

      case BlocThemeSwitcher.routeName:
        return MaterialPageRoute(
          builder: (context) => const BlocThemeSwitcher(),
        );

      case CubitThemeSwitcher.routeName:
        return MaterialPageRoute(
          builder: (context) => const CubitThemeSwitcher(),
        );

      case CubitRelationship.routeName:
        return MaterialPageRoute(
          builder: (context) => const CubitRelationship(),
        );

      case BlocRelationship.routeName:
        return MaterialPageRoute(
          builder: (context) => const BlocRelationship(),
        );

      case BlocAccess.routeName:
        return MaterialPageRoute(
          builder: (context) => const BlocAccess(),
        );

      case EventTransformer.routeName:
        return MaterialPageRoute(
          builder: (context) => const EventTransformer(),
        );

      case HydCounter.routeName:
        return MaterialPageRoute(
          builder: (context) => const HydCounter(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Screen2.routeName:
        return MaterialPageRoute(
          builder: (context) => const Screen2(),
        );

      case TodoAppCubit.routeName:
        return MaterialPageRoute(
          builder: (context) => const TodoAppCubit(),
        );

      case TodoAppBloc.routeName:
        return MaterialPageRoute(
          builder: (context) => const TodoAppBloc(),
        );

      case WeatherAppCubit.routeName:
        return MaterialPageRoute(
          builder: (context) => const WeatherAppCubit(),
        );
      case WeatherAppBloc.routeName:
        return MaterialPageRoute(
          builder: (context) => const WeatherAppBloc(),
        );
      case SettingsScreenCubit.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreenCubit(),
        );

      case SettingsScreenBloc.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreenBloc(),
        );

      case AuthEntryCubit.routeName:
        return MaterialPageRoute(
          builder: (context) => const AuthEntryCubit(),
        );

      case AuthScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );

      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );

      case RetrievePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RetrievePasswordScreen(),
        );
    }
    return null;
  }
}
