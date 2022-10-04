// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Addition/SubTaskDep.dart';
import 'package:whatodo/Screens/Addition/SubTaskList.dart';
import 'package:whatodo/Styles.dart';

class subTask extends StatelessWidget {
  final List<String> list;
  final List<int> dep;
  final Function callback;
  const subTask(
      {Key? key, required this.list, required this.dep, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(XS + 2, M - 3, 12, XS),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MontText(
            text: 'SubTasks',
            weight: FontWeight.w600,
            size: M + 3,
            letter: -0.35,
            color: Colors.black),
        SizedBox(height: XS),
        TaskList(list: list),
        SizedBox(height: M),
        Dependencies(dep: dep),
      ]));
}
