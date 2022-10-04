// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatodo/Styles.dart';

class RecurModal extends StatelessWidget {
  const RecurModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: L, right: XS),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //STARTS
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SansText(
                text: 'Starts',
                weight: FontWeight.w500,
                size: M + 1,
                color: ThemeColors.blueBlack.withOpacity(.7)),
            SansText(
                text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                weight: FontWeight.w400,
                size: M - 1.25,
                color: ThemeColors.blue.withOpacity(.8))
          ]),
          SizedBox(height: L / 2),
          //REPEATS
          SansText(
            text: 'Repeats',
            weight: FontWeight.w500,
            size: M + 1,
            color: ThemeColors.blueBlack.withOpacity(.7),
          ),
          //ENDS
        ]));
  }
}
