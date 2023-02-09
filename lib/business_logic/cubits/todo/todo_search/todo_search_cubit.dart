import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchInitial());
}
