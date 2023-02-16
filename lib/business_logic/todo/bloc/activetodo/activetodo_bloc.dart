import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../todolist/todolist_bloc.dart';

part 'activetodo_event.dart';

part 'activetodo_state.dart';

class ActiveTodoBloc extends Bloc<ActiveTodoEvent, ActiveTodoState> {
  final TodoListBloc todoListState;
  final int initialTodoCount;
  late StreamSubscription todoListSubscription;

  ActiveTodoBloc({required this.todoListState, required this.initialTodoCount})
      : super(ActiveTodoState(activeTodoCount: initialTodoCount)) {
    todoListSubscription = todoListState.stream.listen((todoListState) {
      on<UpdateActiveTodo>((event, emit) {
        final activeTodoCount = todoListState.todoList
            .where((todo) => !todo.isCompleted)
            .toList()
            .length;

        emit(state.copyWith(activeTodoCount: activeTodoCount));
      });
    });
  }
}
