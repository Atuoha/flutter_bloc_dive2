
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'hyd_counter_event.dart';

part 'hyd_counter_state.dart';

class HydCounterBloc extends Bloc<HydCounterEvent, HydCounterState> with HydratedMixin{
  HydCounterBloc() : super(HydCounterState.initial()) {

    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }

  @override
  HydCounterState? fromJson(Map<String, dynamic> json) {
   print('Counter from storage: $json');
   final counterState = HydCounterState.fromJson(json);
   print('CounterState: $counterState');
   return counterState;
  }

  @override
  Map<String, dynamic>? toJson(HydCounterState state) {
    print('CounterState from storage: $state');
    final counterJson = state.toJson();
    print('CounterJson: $counterJson');
    return counterJson;

  }
}
