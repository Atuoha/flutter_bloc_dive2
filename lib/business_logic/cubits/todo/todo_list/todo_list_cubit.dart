import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  addTodo(Todo newTodo) {
    final newTodos = [
      ...state.todoList,
      newTodo,
    ];
    emit(state.copyWith(todoList: newTodos));
  }

  void removeTodo(String id) {
    final newTodos =
        state.todoList.where((todo) => todo.id != id).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  Todo findById(String id) {
    return state.todoList.firstWhere((todo) => todo.id == id);
  }

  void editTodo(Todo editTodo) {
    final newTodos = state.todoList.map((todo) {
      if (todo.id == editTodo.id) {
        return Todo(
          id: editTodo.id,
          title: editTodo.title,
          content: editTodo.content,
          date: editTodo.date,
          isCompleted: editTodo.isCompleted,
        );
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void toggleCompleted(String id) {
    final newTodos = state.todoList.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          content: todo.content,
          isCompleted: !todo.isCompleted,
          date: todo.date,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(
      todoList: newTodos,
    ));
  }
}
