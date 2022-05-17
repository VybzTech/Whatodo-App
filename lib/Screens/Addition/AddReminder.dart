// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, M - 3, 12, L * 3),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MontText(
                text: 'Reminder',
                weight: FontWeight.w600,
                size: M + 2,
                letter: -0.2,
                color: Colors.black,
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
                    text: '35hr 40mins',
                    weight: FontWeight.w500,
                    color: ThemeColors.gray.withOpacity(.7),
                    size: S,
                  )
                ],
              ),
            ]));
  }
}
