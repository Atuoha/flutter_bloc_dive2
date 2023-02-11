import 'package:flutter/material.dart';
import 'todo_tile.dart';
import '../../../../data/models/todo/todo.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({
    Key? key,
    required this.todoList,
    required this.updateTodoStatus,
    required this.removeFromList,
  }) : super(key: key);
  final List<Todo> todoList;
  final Function updateTodoStatus;
  final Function removeFromList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        Todo todo = todoList[index];
        return TodoTile(
          removeFromList: removeFromList,
          todo: todo,
          updateTodoStatus: updateTodoStatus,
          index: index,
        );
      },
    );
  }
}
