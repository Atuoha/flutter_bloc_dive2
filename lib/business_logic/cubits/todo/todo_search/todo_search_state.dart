part of 'todo_search_cubit.dart';

@immutable
class TodoSearchState extends Equatable {
  final String keyword;

  const TodoSearchState({required this.keyword});

  factory TodoSearchState.initial() => const TodoSearchState(keyword: '');

  @override
  List<Object?> get props => [keyword];

  @override
  String toString() => 'TodoSearchState{keyword: $keyword}';

  TodoSearchState copyWith({
    String? keyword,
  }) {
    return TodoSearchState(
      keyword: keyword ?? this.keyword,
    );
  }
}
