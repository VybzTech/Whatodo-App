// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class SubTasks extends StatelessWidget {
  final int num;
  const SubTasks({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var plural = num > 1 ? 's' : '';
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MontText(
            text: '$num Sub Task$plural',
            weight: FontWeight.w700,
            color: ThemeColors.blueBlack,
            size: M - 2,
          ),
          SizedBox(
            height: XS,
          ),
          SansText(
            text: 'Wash Clothes',
            weight: FontWeight.w500,
            color: ThemeColors.blueBlack.withOpacity(.7),
            size: S,
          ),
          SizedBox(
            height: 3,
          ),
          SansText(
            text: 'Workout',
            weight: FontWeight.w500,
            color: ThemeColors.blueBlack.withOpacity(.7),
            size: S,
          ),
          SizedBox(
            height: 3,
          ),
          SansText(
            text: 'Design UI',
            weight: FontWeight.w500,
            color: ThemeColors.blueBlack.withOpacity(.7),
            size: S,
          ),
        ]);
  }
}
