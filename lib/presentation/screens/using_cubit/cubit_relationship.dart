import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/color/color_cubit.dart';
import '../../../business_logic/cubits/counter_for_color/counter_color_cubit.dart';

class CubitRelationship extends StatefulWidget {
  const CubitRelationship({Key? key}) : super(key: key);
  static const routeName = '/cubit_relationship';

  @override
  State<CubitRelationship> createState() => _CubitRelationshipState();
}

class _CubitRelationshipState extends State<CubitRelationship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Relationship'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           FloatingActionButton(
            onPressed: ()=> context.read<CounterColorCubit>().decrementCounter(),
            heroTag: 'btn1',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: ()=> context.read<ColorCubit>().changeColor(),
            heroTag: 'btn2',
            child: const Icon(Icons.recycling),
          ),
          const SizedBox(
            width: 10,
          ),
           FloatingActionButton(
            onPressed: ()=>context.read<CounterColorCubit>().incrementCounter(),
            heroTag: 'btn3',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: const Center(
        child: Text(
          '0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
