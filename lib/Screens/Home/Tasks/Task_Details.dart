// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/PillButton.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskIntro.dart';
import 'package:whatodo/Screens/Home/Tasks/DueDate.dart';
import 'package:whatodo/Screens/Home/Tasks/SubTaskList.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskDep.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskNotes.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskPriority.dart';
import 'package:whatodo/Styles.dart';

import 'EditTodo.dart';

class TaskDetails extends StatefulWidget {
  final Todo task;
  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    List<Widget> modals = [
      TaskPriority(task: widget.task),
      DueDate(task: widget.task),
      // Reminder(),
      TaskDep(task: widget.task),
      TaskNotes(task: widget.task),
      SubTaskList(task: widget.task),
    ];

    return Container(
        padding: EdgeInsets.symmetric(vertical: S - 3, horizontal: M - 1),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(M + 4),
                topRight: Radius.circular(M + 4))),
        child: Column(children: [
          SizedBox(height: S),
          TaskIntro(task: widget.task),
          Container(
            width: double.maxFinite,
            height: (MediaQuery.of(context).size.height / 2) + XL * 2,
            padding: EdgeInsets.only(top: S, left: XS, right: XS),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => modals[index],
                separatorBuilder: (BuildContext context, int index) => Line(),
                itemCount: modals.length),
          ),
          PillBtn(
            pad: EdgeInsets.zero,
            marg: EdgeInsets.only(left: XL, right: XL, top: S),
            col1: colorUp(widget.task.priority).withOpacity(.7),
            col2: colorUp(widget.task.priority).withOpacity(.85),
            fnc: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<AppCubits>(context),
                      child: EditTodo(
                        todo: widget.task,
                      ))));
            },
            text: 'Edit Todo',
            textSiz: S + 3.5,
          )
        ]));
  }
}
