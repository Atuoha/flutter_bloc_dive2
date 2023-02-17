import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/todo/todo.dart';
import '../../cubits/todo_list/todo_list_cubit.dart';
import '../todofilter/todofilter_bloc.dart';
import '../todolist/todolist_bloc.dart';
import '../todosearch/todosearch_bloc.dart';

part 'filteredtodo_event.dart';

part 'filteredtodo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  // using StreamSubscription
  // final TodoListBloc todoListBloc;
  // final TodoSearchBloc todoSearchBloc;
  // final TodoFilterBloc todoFilterBloc;
  // late StreamSubscription todoListSubscription;
  // late StreamSubscription todoSearchSubscription;
  // late StreamSubscription todoFilterSubscription;
  // final List<Todo> initialTodoList;
  //
  // FilteredTodoBloc({
  //   required this.todoListBloc,
  //   required this.todoSearchBloc,
  //   required this.todoFilterBloc,
  //   required this.initialTodoList,
  // }) : super(FilteredTodoState(filteredTodos: initialTodoList)) {
  //   todoListSubscription = todoListBloc.stream.listen((TodoListState todoListState) {
  //     setFilterTodos();
  //   });
  //
  //   todoSearchSubscription = todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {
  //     setFilterTodos();
  //   });
  //
  //   todoFilterSubscription = todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
  //     setFilterTodos();
  //   });
  //
  //   on<SetFilteredTodoEvent>((event, emit) {
  //     emit(state.copyWith(filteredTodos: event.filteredTodos));
  //   });
  // }
  //
  // void setFilterTodos() {
  //   List<Todo> filteredTodos;
  //   switch (todoFilterBloc.state.filter) {
  //     case Filter.completed:
  //       filteredTodos = todoListBloc.state.todoList
  //           .where((todo) => todo.isCompleted)
  //           .toList();
  //       break;
  //     case Filter.active:
  //       filteredTodos = todoListBloc.state.todoList
  //           .where((todo) => !todo.isCompleted)
  //           .toList();
  //       break;
  //     case Filter.all:
  //     default:
  //       filteredTodos = todoListBloc.state.todoList;
  //       break;
  //   }
  //
  //   if (todoSearchBloc.state.keyword.isNotEmpty) {
  //     filteredTodos = todoListBloc.state.todoList
  //         .where(
  //           (todo) =>
  //               todo.title
  //                   .toLowerCase()
  //                   .contains(todoSearchBloc.state.keyword) ||
  //               todo.content
  //                   .toLowerCase()
  //                   .contains(todoSearchBloc.state.keyword),
  //         )
  //         .toList();
  //   }
  //
  //   add(SetFilteredTodoEvent(filteredTodos: filteredTodos));
  //   if (kDebugMode) {
  //     print('FILTERED-TODOS: $filteredTodos');
  //   }
  // }
  //
  // @override
  // Future<void> close() {
  //   todoListSubscription.cancel();
  //   todoFilterSubscription.cancel();
  //   todoSearchSubscription.cancel();
  //   return super.close();
  // }

  // engaging Listener
  final List<Todo> initialTodoList;

  FilteredTodoBloc({
    required this.initialTodoList,
  }) : super(FilteredTodoState(filteredTodos: initialTodoList)) {
    on<SetFilteredTodoEvent>((event, emit) {
      List<Todo> filteredTodos;
      switch (event.filter) {
        case Filter.completed:
          filteredTodos =
              event.todoList.where((todo) => todo.isCompleted).toList();
          break;
        case Filter.active:
          filteredTodos =
              event.todoList.where((todo) => !todo.isCompleted).toList();
          break;
        case Filter.all:
        default:
          filteredTodos = event.todoList;
          break;
      }

      if (event.searchKeyword.isNotEmpty) {
        filteredTodos = event.todoList
            .where(
              (todo) =>
                  todo.title.toLowerCase().contains(event.searchKeyword) ||
                  todo.content.toLowerCase().contains(event.searchKeyword),
            )
            .toList();
      }

      emit(state.copyWith(filteredTodos: filteredTodos));
      if (kDebugMode) {
        print('FILTERED-TODOS: $filteredTodos');
      }
    });
  }

// void setFilterTodos(
//     SetFilteredTodoEvent event, Emitter<FilteredTodoState> emit) {
//
// }
}
