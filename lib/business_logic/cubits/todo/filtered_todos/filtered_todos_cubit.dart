import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  FilteredTodosCubit() : super(FilteredTodosInitial());
}
