part of 'activetodo_bloc.dart';

@immutable
class ActiveTodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateActiveTodo extends ActiveTodoEvent {
  final int activeTodoCount;

  UpdateActiveTodo({required this.activeTodoCount});

  @override
  List<Object?> get props => [activeTodoCount];

  @override
  String toString() {
    return 'UpdateActiveTodo{activeTodoCount: $activeTodoCount}';
  }
}
