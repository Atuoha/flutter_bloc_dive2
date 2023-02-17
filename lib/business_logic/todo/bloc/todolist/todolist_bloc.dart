import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';

part 'todolist_event.dart';

part 'todolist_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    // AddTodoEvent
    on<AddTodoEvent>((event, emit) {
      List<Todo> todoList = [...state.todoList, event.newTodo];
      emit(state.copyWith(todoList: todoList));
    });

    // EditTodoEvent
    on<EditTodoEvent>((event, emit) {
      List<Todo> todoList = state.todoList.map((todo) {
        if (todo.id == event.editTodo.id) {
          Todo newEditDetails = event.editTodo;
          return Todo(
              id: newEditDetails.id,
              title: newEditDetails.title,
              content: newEditDetails.content,
              date: newEditDetails.date,
              isCompleted: newEditDetails.isCompleted);
        }
        return todo;
      }).toList();
      emit(state.copyWith(todoList: todoList));
    });

    // DeleteTodoEvent
    on<DeleteTodoEvent>((event, emit) {
      List<Todo> todoList =
          state.todoList.where((todo) => todo.id != event.id).toList();

      emit(state.copyWith(todoList: todoList));
    });

    // FindById
    Todo findById(String id) {
      return state.todoList.firstWhere((todo) => todo.id == id);
    }

    on<FindById>((event, emit) {
     Todo todo =  state.todoList.firstWhere((todo) => todo.id == event.id);
    });

    // ToggleTodoStatus
    on<ToggleTodoStatus>((event, emit) {
      List<Todo> todoList = state.todoList.map((todo) {
        if (todo.id == event.id) {
          return Todo(
              id: todo.id,
              title: todo.title,
              content: todo.content,
              date: todo.date,
              isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();

      emit(state.copyWith(todoList: todoList));
    });
  }
}
