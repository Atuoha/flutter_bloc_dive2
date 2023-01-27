import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterValue: 0));

  void incrementCounter() => emit(
        CounterState(counterValue: state.counterValue + 1),
      );

  void decrementCounter() => emit(
        CounterState(counterValue: state.counterValue - 1),
      );
}
