part of 'filteredtodo_bloc.dart';

@immutable
class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodoState({required this.filteredTodos});

  factory FilteredTodoState.initial() =>
      const FilteredTodoState(filteredTodos: []);

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() {
    return 'FilteredTodoState{filteredTodos: $filteredTodos}';
  }

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
