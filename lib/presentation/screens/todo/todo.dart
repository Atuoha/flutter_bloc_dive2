import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import '../../../business_logic/cubits/todo/cubits.dart';
import '../../../data/models/todo/todo.dart';
import 'components/build_list_view.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);
  static const routeName = "/todo";

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  void addTodo() {
    Todo newTodo = Todo(
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      date: selectedDate,
    );
    context.read<TodoListCubit>().addTodo(newTodo);
    setState(() {
      isDateSelected = false;
    });
    Navigator.of(context).pop();
  }

  // remove from list
  void removeFromList(Todo todo) {
    context.read<TodoListCubit>().removeTodo(todo);
  }

  void updateTodoStatus(String id, bool status) {
    context.read<TodoListCubit>().toggleCompleted(id, status);
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

  // create modal
  Future createModal() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Fill form to submit a new todo'),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Title',
                label: const Text('Enter Title'),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              minLines: 2,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Content',
                label: const Text('Enter Content'),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
                  icon: const Icon(Icons.save),
                  onPressed: () => addTodo(),
                  label: const Text('Submit Todo'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.blue.withOpacity(0.5),
      ),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => createModal(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text(
            'Todo App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            Text(
              '${context.watch<ActiveTodoCountCubit>().state.activeCount} Items Left',
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Todo',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.white70,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const TabBar(
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                  ],
                ),
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
            child: TabBarView(
              children: [
                // All Todos Tab
                BuildListView(
                  todoList:
                      context.read<FilteredTodosCubit>().state.filteredTodos,
                  updateTodoStatus: updateTodoStatus,
                  removeFromList: removeFromList,
                ),

                // Active Todos Tab
                BuildListView(
                  todoList:
                      context.read<FilteredTodosCubit>().state.filteredTodos,
                  updateTodoStatus: updateTodoStatus,
                  removeFromList: removeFromList,
                ),

                // Completed Todos Tab
                BuildListView(
                  todoList:
                      context.read<FilteredTodosCubit>().state.filteredTodos,
                  updateTodoStatus: updateTodoStatus,
                  removeFromList: removeFromList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
