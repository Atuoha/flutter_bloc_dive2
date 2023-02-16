import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/todo/todo.dart';

part 'todofilter_event.dart';
part 'todofilter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {


    on<ChangeFilter>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
