// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:whatodo/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Components/emptyBox.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/SlidableWidget.dart';
import 'package:whatodo/Screens/Home/SeeAllBtn.dart';
import 'package:whatodo/Screens/Home/Todo_Preview.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final String title;
  TodoList({Key? key, required this.todos, required this.title})
      : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    void dismissSlidableItem(BuildContext _, int i, SlideActions actions) {
      switch (actions) {
        case SlideActions.archive:
          print('Task should Archive');
          break;
        case SlideActions.delete:
          print('Task should be deleted');
          // setState(() {
          // widget.todos[i].deleted = !widget.todos[i].deleted;
          // });
          // BlocProvider.of<AppCubits>(context).deleteTask(widget.todos[i].id);
          break;
      }
    }

    if (widget.todos.isEmpty) {
      return EmptyBox(pillName: widget.title);
    }

    int priotize(String str) {
      int index = 0;
      priorities.forEach((priority) {
        if (priority['Name'] == str) setState(() => index = priority['Index']);
      });
      return index;
    }

    widget.todos
        .sort((a, b) => priotize(b.priority).compareTo(priotize(a.priority)));
    return WhiteBox(
        marg: EdgeInsets.symmetric(vertical: 0, horizontal: M),
        height: 210,
        radius: XS + 2,
        spread: 0.5,
        shadow: ThemeColors.lightGray.withOpacity(.3),
        width: double.maxFinite,
        pad: EdgeInsets.only(right: S - 2, left: S - 3, bottom: S, top: XS),
        child: Column(children: [
          Expanded(
              child: ListView.separated(
                  key: PageStorageKey<String>(widget.title),
                  itemCount: widget.todos.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, i) => TodoPreview(
                      todo: widget
                          .todos[i]), // itemBuilder: (_, i) => SlidableWidget(
                  //     key: UniqueKey(),
                  //     onDismissed: (actions) =>
                  //         dismissSlidableItem(_, i, actions),
                  //     child: TodoPreview(todo: widget.todos[i])),
                  separatorBuilder: (_, i) => Padding(
                      child: Line(), padding: const EdgeInsets.only(left: 5)))),
          SizedBox(height: S),
          SeeAllBtn(todos: widget.todos, title: widget.title)
        ]));
  }
}
