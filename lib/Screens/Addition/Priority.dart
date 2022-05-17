// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Select.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Priority extends StatelessWidget {
  Priority({Key? key}) : super(key: key);

  String dropDownValue = 'None';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MontText(
            text: 'Priority',
            weight: FontWeight.w500,
            size: M - 2,
            color: ThemeColors.blueBlack,
          ),
          WhiteBox(
              pad: EdgeInsets.symmetric(horizontal: S - 2, vertical: 5),
              radius: 7.0,
              spread: 1.5,
              blur: 7,
              shadow: ThemeColors.offWhite,
              height: 35,
              width: 125,
              child: Select())
        ],
      ),
    );
  }
}
