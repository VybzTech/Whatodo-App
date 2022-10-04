// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Styles.dart';

class TaskIntro extends StatefulWidget {
  final Todo task;
  const TaskIntro({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskIntro> createState() => _TaskIntroState();
}

class _TaskIntroState extends State<TaskIntro> {
  @override
  Widget build(BuildContext context) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //COLORED FOLDER
            Container(
                padding: EdgeInsets.all(S),
                decoration: BoxDecoration(
                    color: colorUp(widget.task.priority).withOpacity(.25),
                    borderRadius: BorderRadius.circular(XL * 6)),
                child: Icon(
                    useIcon(MdiIcons.folderMultipleOutline,
                        Icons.folder_copy_outlined),
                    color: colorUp(widget.task.priority),
                    size: M + 2)),
            SizedBox(width: S),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MontText(
                  text: widget.task.taskName,
                  weight: FontWeight.w600,
                  color: ThemeColors.blueBlack.withOpacity(.8),
                  size: M - 2,
                  letter: -.5),
              SizedBox(height: 2),
              SansText(
                  text: widget.task.recurring == ''
                      ? 'PERIODIC TASK'
                      : '${widget.task.recurring.toUpperCase()} TASK',
                  weight: FontWeight.w400,
                  color: ThemeColors.lightGray.withOpacity(.5),
                  size: XS + 2.5)
            ])
          ]);
}
