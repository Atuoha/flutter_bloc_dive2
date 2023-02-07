part of 'hyd_counter_bloc.dart';

@immutable
class HydCounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementCounterEvent extends HydCounterEvent {}

class DecrementCounterEvent extends HydCounterEvent {}
