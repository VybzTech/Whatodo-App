// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Styles.dart';

class DueDate extends StatelessWidget {
  final Todo task;
  const DueDate({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = task.dueDate;
    String reverseStr(String str) {
      return str.split('').reversed.join('');
    }

    return Padding(
        padding: const EdgeInsets.only(top: M - 2.5, bottom: S + 3),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MontText(
                  text: 'Due Date',
                  weight: FontWeight.w500,
                  color: ThemeColors.blueBlack,
                  size: M - 2.5,
                  letter: -0.35),
              Row(children: [
                date == ''
                    ? SizedBox()
                    : Icon(useIcon(MdiIcons.alarm, Icons.alarm),
                        color: ThemeColors.gray.withOpacity(.7), size: M - 3),
                SizedBox(width: XS),
                SansText(
                    text: date == ''
                        ? 'No Due Date'
                        : DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(reverseStr(date))),
                    weight: FontWeight.w400,
                    color: ThemeColors.gray.withOpacity(.7),
                    size: S + 2.5)
              ])
            ]));
  }
}
