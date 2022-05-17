// ignore_for_file: prefer_const_constructors, file_names
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class DueDate extends StatelessWidget {
  const DueDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: M - 2, bottom: XS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MontText(
            text: 'Due Date',
            weight: FontWeight.w600,
            color: ThemeColors.blueBlack,
            size: S + 5,
            letter: 0.25,
          ),
          Row(
            children: [
              Icon(
                Icons.alarm,
                color: ThemeColors.gray.withOpacity(.7),
                size: S,
              ),
              SizedBox(width: XS),
              SansText(
                text: 'Tomorrow 3pm',
                weight: FontWeight.w500,
                color: ThemeColors.gray.withOpacity(.7),
                size: S,
              )
            ],
          ),
        ],
      ),
    );
  }
}
