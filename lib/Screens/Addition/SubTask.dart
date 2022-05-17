// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Addition/SubTaskDep.dart';
import 'package:whatodo/Styles.dart';

class subTask extends StatelessWidget {
  const subTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, M - 3, 12, XS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MontText(
              text: 'SubTasks',
              weight: FontWeight.w600,
              size: M + 2,
              letter: -0.2,
              color: Colors.black,
            ),
            SizedBox(height: S),
            Row(
              children: [
                SizedBox(width: XS),
                SquareBtn(
                    col: ThemeColors.gray.withOpacity(.9),
                    fnc: () {},
                    child: Icon(Icons.add,
                        color: ThemeColors.offWhite, size: M - 3),
                    size: M + 2),
                SizedBox(width: S),
                SansText(
                  text: 'Add a Subtask',
                  weight: FontWeight.w400,
                  color: ThemeColors.gray,
                  size: S,
                )
              ],
            ),
            SizedBox(height: M),
            Dependencies(),
          ],
        ));
  }
}
