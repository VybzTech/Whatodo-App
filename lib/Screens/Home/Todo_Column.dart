// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Styles.dart';
import 'Todo_List.dart';
import 'Todo_Pill.dart';

class TodoColumn extends StatefulWidget {
  final int index;
  final String title;
  List<Todo> todoList;

  TodoColumn({
    Key? key,
    required this.index,
    required this.title,
    required this.todoList,
  }) : super(key: key);

  @override
  State<TodoColumn> createState() => _TodoColumnState();
}

class _TodoColumnState extends State<TodoColumn> {
  bool togg = false;
  void callback() => setState(() => togg = !togg);
  @override
  Widget build(BuildContext context) => Column(children: [
        InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: callback,
            child: TodoPill(
                title: widget.title,
                labelNo: widget.todoList.length.toString(),
                callback: callback,
                togg: togg,
                index: widget.index)),
        togg
            ? TodoList(
                title: widget.title,
                todos: widget.todoList,
              )
            : SizedBox(height: XS),
      ]);
}
