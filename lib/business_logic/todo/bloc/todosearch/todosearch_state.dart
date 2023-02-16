part of 'todosearch_bloc.dart';

@immutable
class TodoSearchState extends Equatable{
  final String keyword;
  const TodoSearchState({required this.keyword});

  factory TodoSearchState.initial()=>const TodoSearchState(keyword: "");

  @override
  List<Object?> get props => [keyword];

  @override
  String toString() {
    return 'TodoSearchState{keyword: $keyword}';
  }

  TodoSearchState copyWith({
    String? keyword,
  }) {
    return TodoSearchState(
      keyword: keyword ?? this.keyword,
    );
  }
}


