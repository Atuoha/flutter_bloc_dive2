import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';

part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final List<Color> colors = [
    Colors.white,
    Colors.brown,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.grey,
    Colors.teal,
    Colors.pink,
    Colors.blueGrey,
    Colors.pinkAccent,
  ];

  ColorBloc() : super(ColorState.initial()) {


    on<ChangeColorEvent>((event, emit) {
      final int randomInt = Random().nextInt(colors.length);
      emit(state.copyWith(color: colors[randomInt]));
    });
  }
}
