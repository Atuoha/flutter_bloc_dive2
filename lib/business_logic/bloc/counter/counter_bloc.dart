import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counterValue: state.counterValue + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(state.copyWith(counterValue: state.counterValue - 1));
    });
  }
}
