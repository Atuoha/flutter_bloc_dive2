part of 'todofilter_bloc.dart';

@immutable
class TodoFilterEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class ChangeFilter extends TodoFilterEvent{
  final Filter newFilter;
  ChangeFilter({required this.newFilter});

  @override
  List<Object?> get props => [newFilter];

  @override
  String toString() {
    return 'ChangeFilter{newFilter: $newFilter}';
  }
}
