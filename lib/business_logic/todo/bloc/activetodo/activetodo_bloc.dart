import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../todolist/todolist_bloc.dart';

part 'activetodo_event.dart';

part 'activetodo_state.dart';

class ActiveTodoBloc extends Bloc<ActiveTodoEvent, ActiveTodoState> {
  final TodoListBloc todoListBloc;
  final int initialTodoCount;
  late StreamSubscription todoListSubscription;

  ActiveTodoBloc({required this.todoListBloc, required this.initialTodoCount})
      : super(ActiveTodoState(activeTodoCount: initialTodoCount)) {
    todoListSubscription = todoListBloc.stream.listen((todoListState) {
      final activeTodoCount = todoListState.todoList
          .where((todo) => !todo.isCompleted)
          .toList()
          .length;

      add(UpdateActiveTodo(activeTodoCount: activeTodoCount));
    });

    on<UpdateActiveTodo>((event, emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }


  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
