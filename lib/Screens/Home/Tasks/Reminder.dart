// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: M - 2, bottom: XS),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          MontText(
              text: 'Reminder',
              weight: FontWeight.w600,
              color: ThemeColors.blueBlack,
              size: M - 1.8),
          Row(children: [
            Icon(Icons.alarm, color: ThemeColors.gray.withAlpha(150), size: S),
            SizedBox(width: XS),
            SansText(
                text: '35hr 40mins',
                weight: FontWeight.w500,
                color: ThemeColors.gray.withAlpha(150),
                size: S)
          ])
        ]));
  }
}
