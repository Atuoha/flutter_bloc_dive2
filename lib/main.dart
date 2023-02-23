import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_dive2/business_logic/weather/bloc/blocs.dart';
import 'package:flutter_bloc_dive2/presentation/routes/route_manager.dart';
import 'package:flutter_bloc_dive2/repositories/weather_repository.dart';
import 'package:flutter_bloc_dive2/services/weather_api_services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'business_logic/bloc/color/color_bloc.dart';
import 'business_logic/bloc/counter_for_color/counter_color_bloc.dart';
import 'business_logic/bloc/hydrated_bloc/counter/hyd_counter_bloc.dart';
import 'business_logic/bloc/hydrated_bloc/theme/hyd_theme_bloc.dart';
import 'business_logic/bloc/theme/theme_bloc.dart';
import 'business_logic/cubits/color/color_cubit.dart';
import 'business_logic/cubits/counter_for_color/counter_color_cubit.dart';
import 'business_logic/cubits/theme/theme_cubit.dart';
import '../../../../business_logic/weather/cubit/cubits.dart';
import 'constants/enums/apptheme.dart';
import 'observer/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'business_logic/todo/bloc/bloc.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load(fileName: '.env');
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
        // BlocProvider(
        //   create: (context) => ThemeBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ThemeCubit(),
        // ),

        BlocProvider(
          create: (context) => ColorCubit(),
        ),

        // hydrated_bloc
        BlocProvider(
          create: (context) => HydCounterBloc(),
        ),

        // BlocProvider(
        //   create: (context) => HydThemeBloc(),
        // ),

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
        // BlocProvider(
        //   create: (context) => TodoListCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => TodoFilterCubit(),
        // ),
        //
        // BlocProvider(
        //   create: (context) => TodoSearchCubit(),
        // ),

        // Using streamSubscription
        // BlocProvider(
        //   create: (context) => ActiveTodoCountCubit(
        //     todoListCubit: BlocProvider.of<TodoListCubit>(context),
        //     initialActiveTodoCount:
        //         context.read<TodoListCubit>().state.todoList.length,
        //   ),
        // ),

        // engaging BlocListener
        // BlocProvider(
        //   create: (context) => ActiveTodoCountCubit(
        //     initialActiveTodoCount:
        //         context.read<TodoListCubit>().state.todoList.length,
        //   ),
        // ),

        // using StreamSubscriptions
        // BlocProvider(
        //   create: (context) => FilteredTodosCubit(
        //     initialTodos: context.read<TodoListCubit>().state.todoList,
        //     todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
        //     todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
        //     todoListCubit: BlocProvider.of<TodoListCubit>(context),
        //   ),
        // ),

        // engaging BlocListener
        // BlocProvider(
        //   create: (context) => FilteredTodosCubit(
        //     initialTodos: context.read<TodoListCubit>().state.todoList,
        //   ),
        // ),
        // TodoApp Cubits

        // TodoApp Bloc
        BlocProvider(create: (context) => TodoListBloc()),
        BlocProvider(create: (context) => TodoSearchBloc()),
        BlocProvider(create: (context) => TodoFilterBloc()),

        // using StreamSubcription
        // BlocProvider(
        //   create: (context) => ActiveTodoBloc(
        //     todoListBloc: BlocProvider.of<TodoListBloc>(context),
        //     initialTodoCount:
        //     context.read<TodoListBloc>().state.todoList.length,
        //   ),
        // ),

        BlocProvider(
          create: (context) => ActiveTodoBloc(
            initialTodoCount:
                context.read<TodoListBloc>().state.todoList.length,
          ),
        ),

        // using streamSubscriptions
        // BlocProvider(
        //   create: (context) => FilteredTodoBloc(
        //     todoListBloc: BlocProvider.of<TodoListBloc>(context),
        //     todoSearchBloc: BlocProvider.of<TodoSearchBloc>(context),
        //     todoFilterBloc: BlocProvider.of<TodoFilterBloc>(context),
        //     initialTodoList: BlocProvider.of<TodoListBloc>(context).state.todoList,
        //   ),
        // ),

        // engaging BlocListener
        BlocProvider(
          create: (context) => FilteredTodoBloc(
            initialTodoList:
                BlocProvider.of<TodoListBloc>(context).state.todoList,
          ),
        ),

        // Cubit WeatherApp
        BlocProvider(
          create: (context) => WeatherCubit(
            weatherRepository: WeatherRepository(
              weatherApiService: WeatherApiServices(
                httpClient: http.Client(),
              ),
            ),
          ),
        ),

        // using Cubit StreamSubscription
        // BlocProvider(
        //   create: (context) =>
        //       WeatherThemeCubit(weatherCubit: context.read<WeatherCubit>()),
        // ),

        // using BlocListener
        // BlocProvider(
        //   create: (context) => WeatherThemeCubit(),
        // ),
        //
        // BlocProvider(create: (context) => TempSettingsCubit()),

        // USING BLoc for Weather
        BlocProvider(create: (context) => TempSettingsBloc()),
        BlocProvider(
          create: (context) => WeatherBloc(
            weatherRepository: WeatherRepository(
              weatherApiService: WeatherApiServices(
                httpClient: http.Client(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeSettingsBloc(
            weatherBloc: context.read<WeatherBloc>(),
          ),
        ),

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

      // Weather under Cubit
      // child: BlocListener<WeatherCubit, WeatherState>(
      //   listener: (context, state) {
      //     context.read<WeatherThemeCubit>().changeTheme(state.weather.temp);
      //   },
      //   child: BlocBuilder<WeatherThemeCubit, WeatherThemeState>(
      //     builder: (context, state) {
      //       print(state.theme);
      //       return MaterialApp(
      //         theme: state.theme == AppTheme.dark
      //             ? ThemeData.dark()
      //             : ThemeData.light(),
      //         onGenerateRoute: routeManager?.onGenerateRoute,
      //       );
      //     },
      //   ),
      // ),

      // Weather under Bloc
      child: BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(
        builder: (context, state) {
          print(state.theme);
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
