// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Components/Option.dart';
import 'package:whatodo/Styles.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MontText(
          text: 'Priority',
          weight: FontWeight.w600,
          color: ThemeColors.blueBlack,
          size: S + 5,
          letter: 0.25,
        ),
        WhiteBox(
            marg: EdgeInsets.only(bottom: XS),
            height: L + 7,
            width: XL * 2.7,
            radius: 5.5,
            child: Option(
                name: 'Business',
                col: ThemeColors.blueOriginal.withOpacity(.75)))
      ],
    );
  }
}
