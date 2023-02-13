part of 'active_todo_count_cubit.dart';

@immutable
class ActiveTodoCountState extends Equatable {
  final int activeCount;
  const ActiveTodoCountState({required this.activeCount});

  factory ActiveTodoCountState.initial() =>
      const ActiveTodoCountState(activeCount: 0);

  @override
  List<Object?> get props => [activeCount];

  @override
  String toString() => 'ActiveTodoCountState{activeCount: $activeCount}';

  ActiveTodoCountState copyWith({
    int? activeCount,
  }) {
    return ActiveTodoCountState(
      activeCount: activeCount ?? this.activeCount,
    );
  }
}
