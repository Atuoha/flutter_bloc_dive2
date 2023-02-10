import 'package:flutter/material.dart';
import '../../../../data/models/todo/todo.dart';
import 'package:intl/intl.dart' as intl;

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
        return Dismissible(
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          confirmDismiss: (DismissDirection direction) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete Todo'),
              content: const Text('Do you want to delete this task?'),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) => removeFromList(todo),
          key: ValueKey(index),
          child: ListTile(
            key: ValueKey(index),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => updateTodoStatus(todo.id, value),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(todo.title),
                Text(
                  intl.DateFormat.yMMMEd().format(todo.date),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            subtitle: Text(todo.content),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.note_alt,
              ),
            ),
          ),
        );
      },
    );
  }
}
