// ignore_for_file: file_names, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Option.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Styles.dart';

class TaskPriority extends StatelessWidget {
  final Todo task;
  const TaskPriority({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MontText(
                text: 'Priority',
                weight: FontWeight.w500,
                color: ThemeColors.blueBlack,
                size: M - 2.5,
                letter: -0.2),
            WhiteBox(
                blur: XS,
                spread: 0.3,
                shadow: Colors.black.withOpacity(.1),
                marg: EdgeInsets.only(bottom: S, top: XS - 2),
                pad: EdgeInsets.only(left: S - 2, right: S - 2.5),
                height: XL - 3,
                width: XL * 3.2,
                radius: 5.5,
                child: Center(
                    child: Option(
                        name: task.priority.isEmpty ? 'None' : task.priority,
                        col: colorUp(task.priority).withOpacity(.5),
                        border: colorUp(task.priority))))
          ]);
}
