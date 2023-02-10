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
    print('TODOS: ${state.todoList}');
  }

  void removeTodo(Todo editTodo) {
    final newTodos =
        state.todoList.where((todo) => todo.id != editTodo.id).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void editTodo(Todo editTodo) {
    final newTodos = state.todoList
        .map((todo) => {
              if (todo.id == editTodo.id)
                {
                  todo = Todo(
                    id: editTodo.id,
                    title: editTodo.title,
                    content: editTodo.content,
                    date: editTodo.date,
                    isCompleted: editTodo.isCompleted,
                  )
                }
            })
        .toList();
    emit(state.copyWith(todoList: newTodos.cast()));
  }

  void toggleCompleted(String id, bool status) {
    final List<Todo> newTodos = state.todoList
        .map((todo) => {
              if (todo.id == id) {todo.isCompleted = status}
            })
        .cast<Todo>()
        .toList();

    emit(state.copyWith(todoList: newTodos));
  }
}
