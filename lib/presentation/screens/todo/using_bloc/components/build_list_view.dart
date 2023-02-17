import 'package:flutter/material.dart';
import 'todo_tile.dart';
import '../../../../../data/models/todo/todo.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({
    Key? key,
    required this.todoList,
    required this.removeFromList,
    required this.toggleTodoStatus,
    required this.editTodo,
  }) : super(key: key);
  final List<Todo> todoList;
  final Function removeFromList;
  final Function toggleTodoStatus;
  final Function editTodo;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        Todo todo = todoList[index];
        return TodoTile(
          removeFromList: removeFromList,
          toggleTodoStatus: toggleTodoStatus,
          todo: todo,
          index: index, editTodo: editTodo,
        );
      },
    );
  }
}
