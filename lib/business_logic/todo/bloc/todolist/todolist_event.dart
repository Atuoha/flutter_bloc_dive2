part of 'todolist_bloc.dart';

@immutable
class TodoListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final Todo newTodo;

  AddTodoEvent({required this.newTodo});

  @override
  List<Object?> get props => [newTodo];

  @override
  String toString() {
    return 'AddTodoEvent{newTodo: $newTodo}';
  }
}

class EditTodoEvent extends TodoListEvent {
  final Todo editTodo;

  EditTodoEvent({required this.editTodo});

  @override
  List<Object?> get props => [editTodo];

  @override
  String toString() {
    return 'EditTodoEvent{editTodo: $editTodo}';
  }
}

class DeleteTodoEvent extends TodoListEvent {
  final String id;

  DeleteTodoEvent({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'DeleteTodoEvent{id: $id}';
  }
}

class FindById extends TodoListEvent {
  final String id;
  FindById({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'FindById{id: $id}';
  }
}

class ToggleTodoStatus extends TodoListEvent {
  final String id;

  ToggleTodoStatus({required this.id});

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'ToggleTodoStatus{id: $id}';
  }
}
