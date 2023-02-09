import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterInitial());
}
