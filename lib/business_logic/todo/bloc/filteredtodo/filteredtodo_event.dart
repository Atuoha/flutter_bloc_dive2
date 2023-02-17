part of 'filteredtodo_bloc.dart';

@immutable
class FilteredTodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetFilteredTodoEvent extends FilteredTodoEvent {
  final List<Todo> filteredTodos;

  SetFilteredTodoEvent({required this.filteredTodos});

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() {
    return 'SetFilteredTodoEvent{filteredTodos: $filteredTodos}';
  }
}

// class SetFilteredTodoEvent extends FilteredTodoEvent {
//   final String searchKeyword;
//   final Filter filter;
//   final TodoListCubit todoList;
//
//   SetFilteredTodoEvent({
//     required this.searchKeyword,
//     required this.filter,
//     required this.todoList,
//   });
//
//   @override
//   List<Object?> get props => [searchKeyword, filter, todoList];
//
//   @override
//   String toString() {
//     return 'SetFilteredTodoEvent{searchKeyword: $searchKeyword, filter: $filter, todoList: $todoList}';
//   }
// }
