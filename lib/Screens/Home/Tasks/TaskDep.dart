// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class TaskDep extends StatelessWidget {
  final Todo task;
  const TaskDep({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dependencies = BlocProvider.of<AppCubits>(context).dependencies;

    return Padding(
        padding: EdgeInsets.only(top: S, bottom: S, right: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: dependencies.map((dep) {
                    if (task.dep.contains(dep['index'])) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Icon(useIcon(dep['AndIcon'], dep['icon']),
                            size: M, color: dep['col']),
                      );
                    }
                    return SizedBox();
                  }).toList()),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MontText(
                        text:
                            DateFormat('EEE, dd LLL').format(task.createdTime),
                        weight: FontWeight.w500,
                        color: ThemeColors.blueBlack.withOpacity(.5),
                        size: S + 1.75),
                    SizedBox(height: 2),
                    SansText(
                        text: 'Date Created',
                        weight: FontWeight.w400,
                        color: ThemeColors.gray.withOpacity(.5),
                        size: S - 1.5)
                  ])
            ]));
  }
}
