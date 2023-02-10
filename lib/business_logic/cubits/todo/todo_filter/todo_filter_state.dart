part of 'todo_filter_cubit.dart';

@immutable
class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({required this.filter});

  factory TodoFilterState.initial() =>
      const TodoFilterState(filter: Filter.all);

  @override
  String toString() => 'TodoFilterState{filter: $filter}';

  @override
  List<Object?> get props => [filter];

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}
