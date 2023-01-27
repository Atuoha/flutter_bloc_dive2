part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  factory CounterState.initial()=> const CounterState(counterValue: 0);

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue];

  CounterState copyWith({int? counterValue}) =>
      CounterState(counterValue: counterValue ?? this.counterValue);
}
