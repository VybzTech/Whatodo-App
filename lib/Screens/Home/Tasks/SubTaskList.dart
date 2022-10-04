// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Styles.dart';

class SubTaskList extends StatelessWidget {
  final Todo task;
  const SubTaskList({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: XS, left: XS),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MontText(
                text:
                    '${task.subtasks.isEmpty ? 'No' : task.subtasks.length} Sub Task${plural(task.subtasks.length)}',
                weight: FontWeight.w700,
                color: ThemeColors.blueBlack.withOpacity(.85),
                size: M - 4),
            SizedBox(height: XS - 3),
            Container(
              height: 19.0 * task.subtasks.length,
              width: double.maxFinite,
              child: ListView(
                  padding: EdgeInsets.only(left: XS),
                  semanticChildCount: task.subtasks.length,
                  children: task.subtasks
                      .map((String str) => Row(children: [
                            Icon(
                                useIcon(MdiIcons.circleMultiple,
                                    Icons.fiber_smart_record_rounded),
                                color: colorUp(task.priority).withOpacity(.5),
                                size: S - 2),
                            SizedBox(width: 5),
                            SansText(
                                text: str,
                                weight: FontWeight.w400,
                                color: ThemeColors.blueBlack.withOpacity(.7),
                                size: S + 2.5,
                                align: TextAlign.left)
                          ]))
                      .toList()),
            )
          ]));
}
