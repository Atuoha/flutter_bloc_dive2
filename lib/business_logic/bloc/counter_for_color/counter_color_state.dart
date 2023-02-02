part of 'counter_color_bloc.dart';

@immutable
class CounterColorState extends Equatable {
  final int counter;

  const CounterColorState({required this.counter});

  factory CounterColorState.initial() => const CounterColorState(counter: 1);

  @override
  List<Object?> get props => [counter];

  @override
  String toString() => 'CounterColorState(counter:$counter)';

  CounterColorState copyWith({int? counter}) {
    return CounterColorState(counter: counter ?? this.counter);
  }
}
