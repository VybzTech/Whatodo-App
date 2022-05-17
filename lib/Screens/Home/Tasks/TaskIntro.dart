// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class TaskIntro extends StatelessWidget {
  final String day;
  final String task;
  const TaskIntro({
    Key? key,
    required this.day,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //COLORED FOLDER
        Container(
          padding: EdgeInsets.all(S - 2),
          decoration: BoxDecoration(
              color: ThemeColors.whitishBlue.withOpacity(.5),
              borderRadius: BorderRadius.circular(XL * 6)),
          child: Icon(
            Icons.folder_outlined,
            color: ThemeColors.blueOriginal,
            size: M + 3,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SansText(
              text: day.toUpperCase(),
              weight: FontWeight.w600,
              color: ThemeColors.gray.withOpacity(.8),
              size: S - 2,
            ),
            SansText(
              text: task,
              weight: FontWeight.w800,
              color: ThemeColors.blueBlack,
              size: M - 1,
              letter: -.1,
            ),
            SizedBox(height: 2),
            SansText(
              text: 'Recurring Task',
              weight: FontWeight.w400,
              color: ThemeColors.lightGray,
              size: 10.25,
            )
          ],
        ),
      ],
    );
  }
}
