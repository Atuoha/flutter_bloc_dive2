part of 'filtered_todos_cubit.dart';

@immutable
class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

  const FilteredTodosState({required this.filteredTodos});

  factory FilteredTodosState.initial() =>
      const FilteredTodosState(filteredTodos: []);

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodosState{filteredTodos: $filteredTodos}';

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
