import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/todo/using_bloc/todo.dart';
import 'package:flutter_bloc_dive2/presentation/screens/todo/using_cubit/todo.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_bloc/bloc_access.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_bloc/bloc_relationship.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_bloc/theme_switcher.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_cubit/cubit_relationship.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_cubit/theme_switcher.dart';
import 'event_transformer/event_transformer.dart';
import 'hydrated_bloc/counter_app.dart';
import 'using_bloc/bloc_screen1.dart';
import 'using_cubit/cubit_screen1.dart';

import '../../utilities/components/gridItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIVE INTO CUBIT/BLOC'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18,),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: const [
            GridItem(
              title: 'Todo App Cubit',
              routeName: TodoAppCubit.routeName,
            ),
            GridItem(
              title: 'Todo App Bloc',
              routeName: TodoAppBloc.routeName,
            ),
            GridItem(
              title: 'Counter Using Cubit',
              routeName: CubitScreen.routeName,
            ),
            GridItem(
              title: 'Counter Using Bloc',
              routeName: BlocScreen.routeName,
            ),

            GridItem(
              title: 'Bloc Theme',
              routeName: BlocThemeSwitcher.routeName,
            ),

            GridItem(
              title: 'Cubit Theme',
              routeName: CubitThemeSwitcher.routeName,
            ),

            GridItem(
              title: 'Cubit Relationship',
              routeName: CubitRelationship.routeName,
            ),
            GridItem(
              title: 'Bloc Relationship',
              routeName: BlocRelationship.routeName,
            ),

            GridItem(
              title: 'Bloc Access',
              routeName: BlocAccess.routeName,
            ),

            GridItem(
              title: 'Event Transformer',
              routeName: EventTransformer.routeName,
            ),

            GridItem(
              title: 'Hydrated Bloc',
              routeName: HydCounter.routeName,
            ),

          ],
        ),
      ),
    );
  }
}
