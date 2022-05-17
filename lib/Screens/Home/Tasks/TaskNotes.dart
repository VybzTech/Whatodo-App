// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class TaskNotes extends StatelessWidget {
  final String note;
  const TaskNotes({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XL * 2.5,
      padding: EdgeInsets.fromLTRB(S, XS, S, S),
      margin: EdgeInsets.symmetric(horizontal: S, vertical: S),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.whitishBlue, width: 2),
          color: ThemeColors.whitishBlue.withOpacity(.8),
          borderRadius: BorderRadius.circular(XS)),
      child: SansText(
        text: note,
        weight: FontWeight.w400,
        size: S,
        color: Colors.white,
      ),
    );
  }
}
