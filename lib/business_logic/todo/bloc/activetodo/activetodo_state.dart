part of 'activetodo_bloc.dart';

@immutable
class ActiveTodoState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoState({required this.activeTodoCount});

  factory ActiveTodoState.initial() =>
      const ActiveTodoState(activeTodoCount: 0);

  @override
  List<Object?> get props => [activeTodoCount];

  @override
  String toString() {
    return 'ActiveTodoState{activeTodoCount: $activeTodoCount}';
  }

  ActiveTodoState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
