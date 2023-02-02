part of 'counter_color_bloc.dart';

@immutable
class CounterColorEvent extends Equatable {
  final Color? color;

  const CounterColorEvent({this.color = Colors.white});

  @override
  List<Object?> get props => [color];
}

class ChangeCounterEvent extends CounterColorEvent{}

class IncrementCounterEvent extends CounterColorEvent {}

class DecrementCounterEvent extends CounterColorEvent {}
