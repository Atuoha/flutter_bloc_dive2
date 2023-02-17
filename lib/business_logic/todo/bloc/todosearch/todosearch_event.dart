part of 'todosearch_bloc.dart';

@immutable
class TodoSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetSearchKeywordEvent extends TodoSearchEvent {
  final String keyword;
  SetSearchKeywordEvent({required this.keyword});

  @override
  List<Object?> get props => [keyword];

  @override
  String toString() {
    return 'SetSearchKeyword{keyword: $keyword}';
  }


}
