part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}
