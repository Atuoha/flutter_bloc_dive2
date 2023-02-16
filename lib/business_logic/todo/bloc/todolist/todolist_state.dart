part of 'todolist_bloc.dart';

@immutable
class TodoListState extends Equatable {
  final List<Todo> todoList;

  const TodoListState({required this.todoList});

  factory TodoListState.initial() => const TodoListState(todoList: []);

  @override
  List<Object?> get props => [todoList];

  @override
  String toString() {
    return 'TodoListState{todoList: $todoList}';
  }

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }
}
