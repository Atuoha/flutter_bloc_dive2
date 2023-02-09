import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  ActiveTodoCountCubit() : super(ActiveTodoCountInitial());
}
