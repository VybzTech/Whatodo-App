// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Styles.dart';

class TaskNotes extends StatelessWidget {
  final Todo task;
  const TaskNotes({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: XL * 2.5,
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(S, XS, S, S),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: S),
      decoration: BoxDecoration(
          border: Border.all(
              color: colorUp(task.priority).withOpacity(.9), width: 2),
          color: colorUp(task.priority).withOpacity(.485),
          borderRadius: BorderRadius.circular(XS)),
      child: SansText(
          align: TextAlign.left,
          text: '${task.notes} ...',
          weight: FontWeight.w500,
          size: S + 3.5,
          color: Colors.white));
}
