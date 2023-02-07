part of 'hyd_counter_bloc.dart';

@immutable
class HydCounterState extends Equatable {
  final int counter;

  const HydCounterState({required this.counter});

  factory HydCounterState.initial() => const HydCounterState(counter: 0);

  @override
  List<Object?> get props => [counter];

  @override
  String toString() => 'HydCounterState(counter: $counter)';

  Map<String, dynamic> toJson() {
    return {
      'counter': counter,
    };
  }

  factory HydCounterState.fromJson(Map<String, dynamic> json) {
    return HydCounterState(
      counter: json['counter'] as int,
    );
  }

  HydCounterState copyWith({
    int? counter,
  }) {
    return HydCounterState(
      counter: counter ?? this.counter,
    );
  }
}
