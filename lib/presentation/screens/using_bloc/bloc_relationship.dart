import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/color/color_bloc.dart';
import '../../../business_logic/bloc/counter_for_color/counter_color_bloc.dart';
import '../../../business_logic/cubits/counter_for_color/counter_color_cubit.dart';

class BlocRelationship extends StatefulWidget {
  const BlocRelationship({Key? key}) : super(key: key);
  static const routeName = '/bloc_relationship';

  @override
  State<BlocRelationship> createState() => _BlocRelationshipState();
}

// bloc to bloc relationship (scroll down)
// class _BlocRelationshipState extends State<BlocRelationship> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bloc Relationship'),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//            FloatingActionButton(
//             onPressed: ()=> context.read<CounterColorBloc>().add(DecrementCounterEvent()),
//             heroTag: 'btn1',
//             child: const Icon(Icons.remove),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             onPressed: ()=> context.read<ColorBloc>().add(ChangeColorEvent()),
//             heroTag: 'btn2',
//             child: const Icon(Icons.recycling),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//            FloatingActionButton(
//             onPressed: ()=>context.read<CounterColorBloc>().add(IncrementCounterEvent()),
//             heroTag: 'btn3',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       backgroundColor:context.watch<ColorBloc>().state.color,
//       body:  Center(
//         child: Text(
//           'Counter: ${context.watch<CounterColorBloc>().state.counter}',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 60,
//           ),
//         ),
//       ),
//     );
//   }
// }






// bloc to listener relationship
class _BlocRelationshipState extends State<BlocRelationship> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
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
        context.read<CounterColorBloc>().add(UpdateCounterEvent(counter: counter));
      },
      child:  Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Relationship'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           FloatingActionButton(
            onPressed: ()=> context.read<CounterColorBloc>().add(DecrementCounterEvent()),
            heroTag: 'btn1',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: ()=> context.read<ColorBloc>().add(ChangeColorEvent()),
            heroTag: 'btn2',
            child: const Icon(Icons.recycling),
          ),
          const SizedBox(
            width: 10,
          ),
           FloatingActionButton(
            onPressed: ()=>context.read<CounterColorBloc>().add(IncrementCounterEvent()),
            heroTag: 'btn3',
            child: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor:context.watch<ColorBloc>().state.color,
      body:  Center(
        child: Text(
          'Counter: ${context.watch<CounterColorBloc>().state.counter}',
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
