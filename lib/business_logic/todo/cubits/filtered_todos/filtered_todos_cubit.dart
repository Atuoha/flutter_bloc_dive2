import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../../../data/models/todo/todo.dart';
import '../todo_list/todo_list_cubit.dart';

part 'filtered_todos_state.dart';

// Using StreamSubscription
// class FilteredTodosCubit extends Cubit<FilteredTodosState> {
//   final TodoFilterCubit todoFilterCubit;
//   final TodoSearchCubit todoSearchCubit;
//   final TodoListCubit todoListCubit;
//   late final StreamSubscription todoFilterSubscription;
//   late final StreamSubscription todoSearchSubscription;
//   late final StreamSubscription todoListSubscription;
//   final List<Todo> initialTodos;
//
//   FilteredTodosCubit({
//     required this.todoFilterCubit,
//     required this.todoSearchCubit,
//     required this.todoListCubit,
//     required this.initialTodos,
//   }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
//     todoFilterSubscription =
//         todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
//       setFilterTodos();
//     });
//
//     todoListSubscription =
//         todoListCubit.stream.listen((TodoListState todoListState) {
//       setFilterTodos();
//     });
//
//     todoSearchSubscription =
//         todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
//       setFilterTodos();
//     });
//   }
//
//   void setFilterTodos() {
//     List<Todo> filterTodos;
//
//     switch (todoFilterCubit.state.filter) {
//       case Filter.active:
//         filterTodos = todoListCubit.state.todoList
//             .where((todo) => !todo.isCompleted)
//             .toList();
//         break;
//
//       case Filter.completed:
//         filterTodos = todoListCubit.state.todoList
//             .where((todo) => todo.isCompleted)
//             .toList();
//         break;
//       case Filter.all:
//       default:
//         filterTodos = todoListCubit.state.todoList;
//     }
//
//     if (todoSearchCubit.state.keyword.isNotEmpty) {
//       String keyword = todoSearchCubit.state.keyword;
//       filterTodos = filterTodos
//           .where(
//             (todo) =>
//                 todo.title.toLowerCase().contains(keyword) ||
//                 todo.content.toLowerCase().contains(keyword),
//           )
//           .toList();
//     }
//
//     emit(state.copyWith(filteredTodos: filterTodos));
//     print('FILTER-TODOS:$filterTodos');
//   }
//
//   @override
//   Future<void> close() {
//     todoSearchSubscription.cancel();
//     todoListSubscription.cancel();
//     todoFilterSubscription.cancel();
//     return super.close();
//   }
// }

// engaging BlocListener
class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosCubit({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos));

  void setFilterTodos({
    required Filter filter,
    required List<Todo> todoList,
    String searchKeyword = "",
  }) {
    List<Todo> filterTodos;

    switch (filter) {
      case Filter.active:
        filterTodos = todoList.where((todo) => !todo.isCompleted).toList();
        break;

      case Filter.completed:
        filterTodos = todoList.where((todo) => todo.isCompleted).toList();
        break;
      case Filter.all:
      default:
        filterTodos = todoList;
    }

    if (searchKeyword.isNotEmpty) {
      filterTodos = filterTodos
          .where(
            (todo) =>
                todo.title.toLowerCase().contains(searchKeyword) ||
                todo.content.toLowerCase().contains(searchKeyword),
          )
          .toList();
    }

    emit(state.copyWith(filteredTodos: filterTodos));
    if (kDebugMode) {
      print('FILTER-TODOS:$filterTodos');
    }
  }
}
