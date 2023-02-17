import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/todo/bloc/todofilter/todofilter_bloc.dart';
import '../../../../../data/models/todo/todo.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        if (index == 0) {
          context
              .read<TodoFilterBloc>()
              .add(ChangeFilter(newFilter: Filter.all));
        } else if (index == 1) {
          context
              .read<TodoFilterBloc>()
              .add(ChangeFilter(newFilter: Filter.active));
        } else {
          context
              .read<TodoFilterBloc>()
              .add(ChangeFilter(newFilter: Filter.completed));
        }
      },
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Active'),
        Tab(text: 'Completed'),
      ],
    );
  }
}
