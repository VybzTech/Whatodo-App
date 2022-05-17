// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoListed(),
    );
  }
}

class TodoListed extends StatefulWidget {
  const TodoListed({Key? key}) : super(key: key);

  @override
  State<TodoListed> createState() => _TodoListedState();
}

class _TodoListedState extends State<TodoListed> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];
  // final List<String> _todoList = <String>[];

  // List<String> storeItems = ['Some Todo Text', 'Another Todo Text'];

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add a new Todo Item'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Type New Todo'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
                child: Text('Add'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos
            .map((Todo todo) => TodoItem(
                  todo: todo,
                  onTodoChanged: _handleTodoChange,
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog();
        },
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
    );
  }

  //ITERATE THRU TODOS
  // List<Widget> _getItems() {
  //   final List<Widget> _todoWidgets = <Widget>[];
  //   for (Todo todo in _todos) {
  //     _todoWidgets.add(_buildTodoItem(title));
  //   }
  //   return _todoWidgets;
  // }

  // Widget _buildStoreList() {
  //   return new ListView.builder(itemBuilder: (_, i) {
  //     if (i < storeItems.length) {
  //       return new ListTile(title: Text('Edit Text'));
  //     }
  //     return Container();
  //   });
  // }
}

class Todo {
  final String name;
  bool checked;
  Todo({required this.name, required this.checked});
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  const TodoItem({
    Key? key,
    required this.onTodoChanged,
    required this.todo,
  }) : super(key: key);

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;
    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(
        todo.name,
        style: _getTextStyle(todo.checked),
      ),
    );
  }
}
