import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/bloc/counter/counter_bloc.dart';

class EventTransformer extends StatefulWidget {
  const EventTransformer({Key? key}) : super(key: key);
  static const routeName = '/event_transformer';

  @override
  State<EventTransformer> createState() => _EventTransformerState();
}

class _EventTransformerState extends State<EventTransformer> {
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
            heroTag: 'btn1',
            onPressed: () => context.read<CounterBloc>().add(
                  IncrementCounterEvent(),
                ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => context.read<CounterBloc>().add(
                  DecrementCounterEvent(),
                ),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Text(
         context.watch<CounterBloc>().state.counterValue.toString(),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
