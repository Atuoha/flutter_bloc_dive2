import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/todo/bloc/activetodo/activetodo_bloc.dart';
import 'package:flutter_bloc_dive2/business_logic/todo/bloc/bloc.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../business_logic/todo/bloc/todolist/todolist_bloc.dart';
import '../../../../business_logic/todo/bloc/bloc.dart';
import '../../../../data/models/todo/todo.dart';
import 'components/build_list_view.dart';
import 'components/search_todo.dart';
import 'components/tabbar.dart';

class TodoAppBloc extends StatefulWidget {
  const TodoAppBloc({Key? key}) : super(key: key);
  static const routeName = "/todo_bloc";

  @override
  State<TodoAppBloc> createState() => _TodoAppBlocState();
}

class _TodoAppBlocState extends State<TodoAppBloc> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;
  bool dateNotSelectedError = false;
  bool isEditState = false;
  Todo? editingTodo;

  void addTodo() {
    var valid = formKey.currentState!.validate();
    formKey.currentState!.save();
    if (!valid) {
      return;
    }
    if (!isEditState) {
      // create new todo
      Todo newTodo = Todo(
        title: titleController.text.trim(),
        content: contentController.text.trim(),
        date: selectedDate,
      );
      context.read<TodoListBloc>().add(AddTodoEvent(newTodo: newTodo));
      afterTodoAddHandles();
    } else {
      //edit todo
      Todo editTodo = Todo(
        id: editingTodo!.id,
        title: titleController.text.trim(),
        content: contentController.text.trim(),
        date: selectedDate,
        isCompleted: editingTodo!.isCompleted,
      );
      context.read<TodoListBloc>().add(EditTodoEvent(editTodo: editTodo));
      closeModalActions();
    }
  }

  // handle add todo
  void afterTodoAddHandles() {
    setState(() {
      isDateSelected = false;
      titleController.clear();
      contentController.clear();
    });
    Navigator.of(context).pop();
    showSnackBarMessage(message: 'Todo added successfully!');
  }

  // editingActions
  void editActions(String id) {
    Todo todo = context
        .read<TodoListBloc>()
        .state
        .todoList
        .firstWhere((todo) => todo.id == id);
    setState(() {
      editingTodo = todo;
      isEditState = true;
      titleController.text = todo.title;
      contentController.text = todo.content;
      selectedDate = todo.date;
      isDateSelected = true;
    });
    createModal();
    showSnackBarMessage(message: 'Editing Completed!');
  }

  // close modal actions
  void closeModalActions() {
    setState(() {
      isEditState = false;
      titleController.clear();
      contentController.clear();
      selectedDate = DateTime.now();
      isDateSelected = false;
    });
    Navigator.of(context).pop();
  }

  // remove from list
  void removeFromList(String id) {
    context.read<TodoListBloc>().add(DeleteTodoEvent(id: id));
    Navigator.of(context).pop();
    showSnackBarMessage(
        message: 'Todo deleted successfully!', background: Colors.red);
  }

  // toggle todo status
  void toggleTodoStatus(String id) {
    context.read<TodoListBloc>().add(ToggleTodoStatus(id: id));
    showSnackBarMessage(message: 'Todo status updated successfully!');
  }

  // pick date
  Future pickDate({required BuildContext context}) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        isDateSelected = true;
        selectedDate = pickedDate;
      });
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarMessage(
      {required String message, Color background = Colors.green}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: background,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // create modal
  Future createModal() {
    return showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => closeModalActions(),
                  icon: const Icon(Icons.close),
                ),
              ),
              Text(!isEditState
                  ? 'Fill form to submit a new todo'
                  : 'You are currently editing this todo'),
              const SizedBox(height: 10),
              textFormField(
                controller: titleController,
                minLines: 1,
                maxLines: 1,
                label: 'Title',
                autofocus: true,
              ),
              const SizedBox(height: 10),
              textFormField(
                controller: contentController,
                minLines: 2,
                maxLines: 3,
                label: 'Content',
                autofocus: false,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDateSelected
                      ? Text(
                          'Selected Date:  ${intl.DateFormat.yMMMEd().format(selectedDate)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : const SizedBox.shrink(),
                  TextButton(
                    onPressed: () => pickDate(
                      context: context,
                    ),
                    child: const Text('Select Date'),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                    ),
                    icon: const Icon(Icons.check_circle),
                    onPressed: () => addTodo(),
                    label: Text(isEditState ? 'Submit Edit' : 'Submit Todo'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => createModal(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text(
            'Todio',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            // using streamSubscription
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: BlocListener<TodoListBloc, TodoListState>(
                  listener: (context, state) {
                    final activeCount = state.todoList
                        .where((todo) => !todo.isCompleted)
                        .length;
                    context
                        .read<ActiveTodoBloc>()
                        .add(UpdateActiveTodo(activeTodoCount: activeCount));
                  },
                  child: Text(
                    '${context.watch<ActiveTodoBloc>().state.activeTodoCount} Items Left',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )

                // using StreamSubscription
                // Text(
                //   '${context.watch<ActiveTodoBloc>().state.activeTodoCount} Items Left',
                //   style: const TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
                )

            // engaging BlocListener on Cubit
            // BlocListener<TodoListCubit, TodoListState>(
            //   listener: (context, state) {
            //     var count =
            //         state.todoList.where((todo) => !todo.isCompleted).length;
            //     context.read<ActiveTodoCountCubit>().calcActiveTodo(count);
            //   },
            //   child: Text(
            //     '${context.watch<ActiveTodoCountCubit>().state.activeCount} Items Left',
            //     style: const TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Column(
              children: const [
                SearchTodo(),
                TabBarWidget(),
              ],
            ),
          ),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child:

                // using StreamSubscription
                // context.watch<FilteredTodoBloc>().state.filteredTodos.isNotEmpty
                //     ? BuildListView(
                //         todoList: context
                //             .watch<FilteredTodoBloc>()
                //             .state
                //             .filteredTodos,
                //         removeFromList: removeFromList,
                //         editTodo: editActions,
                //         toggleTodoStatus: toggleTodoStatus,
                //       )
                //     : Center(
                //         child: Text(
                //           'Opps! ${context.watch<TodoFilterBloc>().state.filter.name} todo list is empty',
                //           style: const TextStyle(
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //       ),

                // engaging BlocListener
                MultiBlocListener(
              listeners: [
                // For TodoFilter
                BlocListener<TodoFilterBloc, TodoFilterState>(
                    listener: (context, state) {
                  context.read<FilteredTodoBloc>().add(
                        SetFilteredTodoEvent(
                          searchKeyword:
                              context.read<TodoSearchBloc>().state.keyword,
                          filter: state.filter,
                          todoList: context.read<TodoListBloc>().state.todoList,
                        ),
                      );
                }),

                // For TodoSearch
                BlocListener<TodoSearchBloc, TodoSearchState>(
                    listener: (context, state) {
                  context.read<FilteredTodoBloc>().add(
                        SetFilteredTodoEvent(
                          searchKeyword: state.keyword,
                          filter: context.read<TodoFilterBloc>().state.filter,
                          todoList: context.read<TodoListBloc>().state.todoList,
                        ),
                      );
                }),

                // For TodoList
                BlocListener<TodoListBloc, TodoListState>(
                    listener: (context, state) {
                  context.read<FilteredTodoBloc>().add(
                        SetFilteredTodoEvent(
                          searchKeyword:
                              context.read<TodoSearchBloc>().state.keyword,
                          filter: context.read<TodoFilterBloc>().state.filter,
                          todoList: state.todoList,
                        ),
                      );
                }),
              ],
              child: context
                      .watch<FilteredTodoBloc>()
                      .state
                      .filteredTodos
                      .isNotEmpty
                  ? BuildListView(
                      todoList:
                          context.watch<FilteredTodoBloc>().state.filteredTodos,
                      removeFromList: removeFromList,
                      editTodo: editActions,
                      toggleTodoStatus: toggleTodoStatus,
                    )
                  : Center(
                      child: Text(
                        'Opps! ${context.watch<TodoFilterBloc>().state.filter.name} todo list is empty',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

// single TextField
TextFormField textFormField({
  required TextEditingController controller,
  required minLines,
  required maxLines,
  required String label,
  required autofocus,
}) {
  return TextFormField(
    controller: controller,
    minLines: minLines,
    maxLines: maxLines,
    autofocus: autofocus,
    decoration: InputDecoration(
      hintText: label,
      label: Text('Enter $label'),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return '$label can not be empty';
      }
      return null;
    },
  );
}
