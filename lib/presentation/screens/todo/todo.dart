import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);
  static const routeName = "/todo";

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool isChecked = false;

  void removeFromList(int id) {}

  Future createModal() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
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
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit Todo'),
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
          actions: const [
            Text(
              '4 Items Left',
              style: TextStyle(
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
          child: TabBarView(
            children: [
              // First Tab
              buildListView(context),

              // Second Tab
              buildListView(context),

              // Third Tab
              buildListView(context),
            ],
          ),
        ),
      ),
    );
  }

  // List View
  ListView buildListView(BuildContext context) {
    return ListView(
      children: List.generate(
        10,
        (index) => Dismissible(
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

          onDismissed: (DismissDirection direction) => removeFromList(index),
          key: ValueKey(index),
          child: ListTile(
            key: ValueKey(index),
            leading: Checkbox(
              value: isChecked,
              onChanged: (value) => setState(
                () {
                  isChecked = value!;
                },
              ),
            ),
            title: Text('Text $index'),
            subtitle: const Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.note_alt,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
