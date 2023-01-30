import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/using_bloc/theme_switcher.dart';
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
        title: const Text('Counter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18,),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: const [
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
              routeName: ThemeSwitcher.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
