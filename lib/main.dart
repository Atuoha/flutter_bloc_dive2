import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_dive2/presentation/routes/route_manager.dart';

import 'business_logic/bloc/theme/theme_bloc.dart';
import 'business_logic/cubits/color/color_cubit.dart';
import 'business_logic/cubits/theme/theme_cubit.dart';
import 'constants/enums/apptheme.dart';

void main() => runApp(
      MyApp(routeManager: RouteManager()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.routeManager}) : super(key: key);

  final RouteManager? routeManager;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),

        BlocProvider(
          create: (context) => ColorCubit(),
        ),
      ],

    //  child: BlocBuilder<ThemeBloc, ThemeState>(   //BLoC
   child: BlocBuilder<ThemeCubit, CubitThemeState>(   //Cubit
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme == AppTheme.dark
                ? ThemeData.dark()
                : ThemeData.light(),
            onGenerateRoute: routeManager?.onGenerateRoute,
          );
        },
      ),

    );
  }
}
