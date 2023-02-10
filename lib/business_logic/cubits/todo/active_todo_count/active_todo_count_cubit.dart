import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/todo/todo_list/todo_list_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  late StreamSubscription todoListSubscription;

  ActiveTodoCountCubit({required this.todoListCubit})
      : super(ActiveTodoCountState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      final int activeTodos = todoListState.todoList
          .where((Todo todo) => !todo.isCompleted)
          .toList()
          .length;
      emit(state.copyWith(activeCount: activeTodos));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
