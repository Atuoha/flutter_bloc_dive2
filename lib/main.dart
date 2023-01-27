import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/counter_cubit.dart';
import 'package:flutter_bloc_dive2/presentation/routes/route_manager.dart';

void main() => runApp(
      MyApp(routeManager: RouteManager()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.routeManager}) : super(key: key);

  final RouteManager? routeManager;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        onGenerateRoute: routeManager?.onGenerateRoute,
      ),
    );
  }
}
