import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubits/counter_cubit.dart';
import '../screen2.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({Key? key}) : super(key: key);
  static const routeName = '/bloc_screen';

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().incrementCounter(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrementCounter(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text('Counter App using BLoc'),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counterValue == 3) {
              final notification = SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.blueGrey,
                content: Text(
                  'The counter is now ${state.counterValue}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(notification);
            } else if (state.counterValue < 0) {
              Navigator.of(context).pushNamed(Screen2.routeName);
            }
          },
          builder: (context, state) => Text(
            state.counterValue.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
