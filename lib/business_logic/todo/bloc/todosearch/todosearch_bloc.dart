import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'todosearch_event.dart';

part 'todosearch_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SetSearchKeywordEvent>((event, emit) {
      emit(state.copyWith(keyword: event.keyword));
    }, transformer: debounce(const Duration(milliseconds: 2000)));
  }

  EventTransformer<SetSearchKeywordEvent> debounce<SetSearchKeywordEvent>(
      Duration duration) {
    return (event, mapper) => event.debounceTime(duration).flatMap(mapper);
  }
}
