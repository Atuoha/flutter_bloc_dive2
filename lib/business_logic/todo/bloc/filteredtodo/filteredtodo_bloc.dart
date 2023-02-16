import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_dive2/business_logic/todo/cubits/cubits.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';
import '../todofilter/todofilter_bloc.dart';
import '../todolist/todolist_bloc.dart';
import '../todosearch/todosearch_bloc.dart';

part 'filteredtodo_event.dart';

part 'filteredtodo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final TodoListBloc todoListBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoFilterBloc todoFilterBloc;
  late StreamSubscription todoListSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoFilterSubscription;

  FilteredTodoBloc({
    required this.todoListBloc,
    required this.todoSearchBloc,
    required this.todoFilterBloc,
  }) : super(FilteredTodoState.initial()) {
    todoListSubscription = todoListBloc.stream.listen((todoListState) {

    });

    todoSearchSubscription = todoSearchBloc.stream.listen((todoSearchState) {});

    todoFilterSubscription = todoFilterBloc.stream.listen((todoFilterState) {});

      on<SetFilteredTodoEvent>((event, emit) {
        List<Todo> filteredTodos;
        switch (event.filter) {
          case Filter.completed:
            filteredTodos = event.todoList.state.todoList
                .where((todo) => todo.isCompleted)
                .toList();
            break;
          case Filter.active:
            filteredTodos = event.todoList.state.todoList
                .where((todo) => !todo.isCompleted)
                .toList();
            break;
          case Filter.all:
          default:
            filteredTodos = event.todoList.state.todoList;
            break;
        }

        if (event.searchKeyword.isNotEmpty) {
          filteredTodos = event.todoList.state.todoList
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
}
