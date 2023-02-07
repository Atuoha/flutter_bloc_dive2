import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../business_logic/bloc/hydrated_bloc/counter/hyd_counter_bloc.dart';
import '../../../business_logic/bloc/hydrated_bloc/theme/hyd_theme_bloc.dart';

class HydCounter extends StatefulWidget {
  const HydCounter({Key? key}) : super(key: key);
  static const routeName = '/hyd_counter';

  @override
  State<HydCounter> createState() => _HydCounterState();
}

class _HydCounterState extends State<HydCounter> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () => context.read<HydThemeBloc>().add(
                  ToggleThemeEvent(),
                ),
            child: Icon(
              context.watch<HydThemeBloc>().state.theme == AppThemed.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => context.read<HydCounterBloc>().add(
                  IncrementCounterEvent(),
                ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () =>
                context.read<HydCounterBloc>().add(DecrementCounterEvent()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btn4',
            onPressed: () => HydratedBloc.storage.clear(),
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Text(
          context.watch<HydCounterBloc>().state.counter.toString(),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
