import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../color/color_bloc.dart';

part 'counter_color_event.dart';

part 'counter_color_state.dart';

class CounterColorBloc extends Bloc<CounterColorEvent, CounterColorState> {
  final ColorBloc colorBloc;
  late StreamSubscription colorSubscription;

  CounterColorBloc({required this.colorBloc})
      : super(CounterColorState.initial()) {
    int incrementValue = 0;

    // bloc to bloc
    // colorSubscription = colorBloc.stream.listen((colorState) {
    //   if (colorState.color == Colors.red) {
    //     incrementValue = 33;
    //   } else if (colorState.color == Colors.yellow) {
    //     incrementValue = -14;
    //   } else if (colorState.color == Colors.blue) {
    //     incrementValue = -10;
    //   } else if (colorState.color == Colors.orange) {
    //     incrementValue = -52;
    //   } else if (colorState.color == Colors.white) {
    //     incrementValue = -11;
    //   } else if (colorState.color == Colors.brown) {
    //     incrementValue = -15;
    //   } else if (colorState.color == Colors.grey) {
    //     incrementValue = -512;
    //   } else if (colorState.color == Colors.teal) {
    //     incrementValue = -24;
    //   } else if (colorState.color == Colors.pink) {
    //     incrementValue = -520;
    //   } else if (colorState.color == Colors.blueGrey) {
    //     incrementValue = -110;
    //   } else if (colorState.color == Colors.pinkAccent) {
    //     incrementValue = 59;
    //   }
    //   add(ChangeCounterEvent());
    // });

    // bloc to bloc
    on<UpdateCounterEvent>((event,emit){
      emit(state.copyWith(counter: state.counter + event.counter));
    });



    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementValue));
    });

    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
