import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

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

  void changeColor() {
    final int randomNumber = Random().nextInt(colors.length);
    emit(state.copyWith(color: colors[randomNumber]));
  }
}
