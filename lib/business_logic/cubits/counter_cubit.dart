import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void incrementCounter() => emit(
        state.copyWith(counterValue: state.counterValue + 1),
      );

  void decrementCounter() => emit(
        state.copyWith(counterValue: state.counterValue - 1),
      );
}
