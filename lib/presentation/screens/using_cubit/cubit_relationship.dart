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

// cubit to cubit relationship (scroll down)
// class _CubitRelationshipState extends State<CubitRelationship> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cubit Relationship'),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//            FloatingActionButton(
//             onPressed: ()=> context.read<CounterColorCubit>().decrementCounter(),
//             heroTag: 'btn1',
//             child: const Icon(Icons.remove),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             onPressed: ()=> context.read<ColorCubit>().changeColor(),
//             heroTag: 'btn2',
//             child: const Icon(Icons.recycling),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//            FloatingActionButton(
//             onPressed: ()=>context.read<CounterColorCubit>().incrementCounter(),
//             heroTag: 'btn3',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       backgroundColor: context.watch<ColorCubit>().state.color,
//       body:  Center(
//         child: Text(
//           'Counter: ${context.watch<CounterColorCubit>().state.counter}',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 60,
//           ),
//         ),
//       ),
//     );
//   }
// }






// cubit to listener relationship
class _CubitRelationshipState extends State<CubitRelationship> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          counter = 33;
        } else if (state.color == Colors.yellow) {
          counter = -14;
        } else if (state.color == Colors.blue) {
          counter = -10;
        } else if (state.color == Colors.orange) {
          counter = -52;
        } else if (state.color == Colors.white) {
          counter = -11;
        } else if (state.color == Colors.brown) {
          counter = -15;
        } else if (state.color == Colors.grey) {
          counter = -512;
        } else if (state.color == Colors.teal) {
          counter = -24;
        } else if (state.color == Colors.pink) {
          counter = -520;
        } else if (state.color == Colors.blueGrey) {
          counter = -110;
        } else if (state.color == Colors.pinkAccent) {
          counter = 59;
        }
        context.read<CounterColorCubit>().changeCounter(counter);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit Relationship'),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterColorCubit>().decrementCounter(),
              heroTag: 'btn1',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () => context.read<ColorCubit>().changeColor(),
              heroTag: 'btn2',
              child: const Icon(Icons.recycling),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterColorCubit>().incrementCounter(),
              heroTag: 'btn3',
              child: const Icon(Icons.add),
            ),
          ],
        ),
        backgroundColor: context.watch<ColorCubit>().state.color,
        body: Center(
          child: Text(
            'Counter: ${context.watch<CounterColorCubit>().state.counter}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}
