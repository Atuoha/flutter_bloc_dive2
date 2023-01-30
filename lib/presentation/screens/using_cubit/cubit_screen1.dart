import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubits/counter/counter_cubit.dart';
import '../screen2.dart';

class CubitScreen extends StatefulWidget {
  const CubitScreen({Key? key}) : super(key: key);
  static const routeName = '/cubit_screen';

  @override
  State<CubitScreen> createState() => _CubitScreenState();
}

class _CubitScreenState extends State<CubitScreen> {
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
        title: const Text('Counter App using Cubit'),
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
