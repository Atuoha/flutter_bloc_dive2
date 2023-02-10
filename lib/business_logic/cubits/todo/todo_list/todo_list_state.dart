part of 'todo_list_cubit.dart';

@immutable
class TodoListState extends Equatable {
  final List<Todo> todoList;

  const TodoListState({required this.todoList});

  factory TodoListState.initial() => const TodoListState(todoList: []);

  @override
  List<Object?> get props => [todoList];

  @override
  String toString() => 'TodoListState{todoList: $todoList}';

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }
}
