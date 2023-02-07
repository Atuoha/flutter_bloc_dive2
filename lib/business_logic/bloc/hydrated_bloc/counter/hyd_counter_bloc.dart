import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hyd_counter_event.dart';
part 'hyd_counter_state.dart';

class HydCounterBloc extends Bloc<HydCounterEvent, HydCounterState> {
  HydCounterBloc() : super(HydCounterInitial()) {
    on<HydCounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
