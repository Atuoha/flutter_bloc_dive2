import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'active_todo_count_state.dart';

// USING StreamSubscription
// class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
//   final TodoListCubit todoListCubit;
//   late StreamSubscription todoListSubscription;
//   final int initialActiveTodoCount;
//
//   ActiveTodoCountCubit({required this.todoListCubit, required this.initialActiveTodoCount})
//       : super(ActiveTodoCountState(activeCount: initialActiveTodoCount)) {
//     todoListSubscription =
//         todoListCubit.stream.listen((TodoListState todoListState) {
//       final int activeTodos = todoListState.todoList
//           .where((Todo todo) => !todo.isCompleted)
//           .toList()
//           .length;
//       emit(state.copyWith(activeCount: activeTodos));
//     });
//   }
//
//   @override
//   Future<void> close() {
//     todoListSubscription.cancel();
//     return super.close();
//   }
// }


// Engaging BlocListener with StreamSubscription
class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final int initialActiveTodoCount;

  ActiveTodoCountCubit(
      {required this.initialActiveTodoCount})
      : super(ActiveTodoCountState(activeCount: initialActiveTodoCount));

  void calcActiveTodo(int count){
    emit(state.copyWith(activeCount: count));
  }
}
