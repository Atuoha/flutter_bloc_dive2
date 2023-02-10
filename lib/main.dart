import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_dive2/presentation/routes/route_manager.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'business_logic/bloc/color/color_bloc.dart';
import 'business_logic/bloc/counter_for_color/counter_color_bloc.dart';
import 'business_logic/bloc/hydrated_bloc/counter/hyd_counter_bloc.dart';
import 'business_logic/bloc/hydrated_bloc/theme/hyd_theme_bloc.dart';
import 'business_logic/bloc/theme/theme_bloc.dart';
import 'business_logic/cubits/color/color_cubit.dart';
import 'business_logic/cubits/counter_for_color/counter_color_cubit.dart';
import 'business_logic/cubits/theme/theme_cubit.dart';
import 'constants/enums/apptheme.dart';
import 'observer/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'business_logic/cubits/todo/cubits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = AppBlocObserver();
  runApp(
    MyApp(routeManager: RouteManager()),
  );
}

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

        // hydrated_bloc
        BlocProvider(
          create: (context) => HydCounterBloc(),
        ),

        BlocProvider(
          create: (context) => HydThemeBloc(),
        ),

        // cubit to cubit
        // BlocProvider(
        //   create: (context) => CounterColorCubit(colorCubit: BlocProvider.of<ColorCubit>(context)),
        // ),

        // cubit to listener
        BlocProvider(
          create: (context) => CounterColorCubit(),
        ),

        BlocProvider(
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => CounterColorBloc(
            colorBloc: context.read<ColorBloc>(),
          ),
        ),

        // TodoApp Cubits
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),

        BlocProvider(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider(
          create: (context) => ActiveTodoCountCubit(
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),

        BlocProvider(
          create: (context) => FilteredTodosCubit(
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),

        // TodoApp Cubits
      ],
      // normal
      // child: BlocBuilder<ThemeBloc, ThemeState>(
      //   //BLoC
      //   //  child: BlocBuilder<ThemeCubit, CubitThemeState>( //Cubit
      //   builder: (context, state) {
      //     return MaterialApp(
      //       theme: state.theme == AppTheme.dark
      //           ? ThemeData.dark()
      //           : ThemeData.light(),
      //       onGenerateRoute: routeManager?.onGenerateRoute,
      //     );
      //   },
      // ),

      // hydrated_bloc version
      child: BlocBuilder<HydThemeBloc, HydThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme == AppThemed.dark
                ? ThemeData.dark()
                : ThemeData.light(),
            onGenerateRoute: routeManager?.onGenerateRoute,
          );
        },
      ),
    );
  }
}
