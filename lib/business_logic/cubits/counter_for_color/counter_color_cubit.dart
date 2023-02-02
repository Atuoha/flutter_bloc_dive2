import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../color/color_cubit.dart';
part 'counter_color_state.dart';


// Cubit to Cubit relationship
// class CounterColorCubit extends Cubit<CounterColorState> {
//   final ColorCubit colorCubit;
//   late StreamSubscription colorSubscription;
//
//   CounterColorCubit({required this.colorCubit})
//       : super(CounterColorState.initial()) {
//     colorSubscription = colorCubit.stream.listen((colorState) {
//       if (colorState.color == Colors.red) {
//         emit(state.copyWith(counter: state.counter + 33));
//       } else if (colorState.color == Colors.yellow) {
//         emit(state.copyWith(counter: state.counter - 14));
//       } else if (colorState.color == Colors.blue) {
//         emit(state.copyWith(counter: state.counter + 53));
//       } else if (colorState.color == Colors.orange) {
//         emit(state.copyWith(counter: state.counter - 28));
//       } else if (colorState.color == Colors.white) {
//         emit(state.copyWith(counter: state.counter - 15));
//       } else if (colorState.color == Colors.brown) {
//         emit(state.copyWith(counter: state.counter + 512));
//       } else if (colorState.color == Colors.grey) {
//         emit(state.copyWith(counter: state.counter - 24));
//       } else if (colorState.color == Colors.teal) {
//         emit(state.copyWith(counter: state.counter - 520));
//       } else if (colorState.color == Colors.pink) {
//         emit(state.copyWith(counter: state.counter - 110));
//       } else if (colorState.color == Colors.blueGrey) {
//         emit(state.copyWith(counter: state.counter - 55));
//       } else if (colorState.color == Colors.pinkAccent) {
//         emit(state.copyWith(counter: state.counter + 59));
//       }
//     });
//   }
//
//   void decrementCounter() {
//     emit(state.copyWith(counter: state.counter + 1));
//   }
//
//   void incrementCounter() {
//     emit(state.copyWith(counter: state.counter - 1));
//   }
//
//   @override
//   Future<void> close() {
//     colorSubscription.cancel();
//     return super.close();
//   }
// }


// Implementing cubit to listener relationship
class CounterColorCubit extends Cubit<CounterColorState> {
  CounterColorCubit()
      : super(CounterColorState.initial());

  void decrementCounter() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void incrementCounter() {
    emit(state.copyWith(counter: state.counter - 1));
  }


  void changeCounter(int counter){
    emit(state.copyWith(counter: state.counter + counter));
  }


}
