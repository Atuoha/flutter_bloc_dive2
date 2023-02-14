import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/todo/todo_filter/todo_filter_cubit.dart';
import 'package:flutter_bloc_dive2/business_logic/cubits/todo/todo_search/todo_search_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';
import '../todo_list/todo_list_cubit.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;
  final List<Todo> initialTodos;

  FilteredTodosCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
    required this.initialTodos,

  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilterTodos();
    });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilterTodos();
    });

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilterTodos();
    });
  }

  void setFilterTodos() {
    List<Todo> filterTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filterTodos = todoListCubit.state.todoList
            .where((todo) => !todo.isCompleted)
            .toList();
        break;

      case Filter.completed:
        filterTodos = todoListCubit.state.todoList
            .where((todo) => todo.isCompleted)
            .toList();
        break;
      case Filter.all:
      default:
        filterTodos = todoListCubit.state.todoList;
    }

    if (todoSearchCubit.state.keyword.isNotEmpty) {
      String keyword = todoSearchCubit.state.keyword;
      filterTodos = filterTodos
          .where(
            (todo) =>
                todo.title.toLowerCase().contains(keyword) ||
                todo.content.toLowerCase().contains(keyword),
          )
          .toList();
    }

    emit(state.copyWith(filteredTodos: filterTodos));
  }

  @override
  Future<void> close() {
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    todoFilterSubscription.cancel();
    return super.close();
  }
}
