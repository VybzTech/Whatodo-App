// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Home/Dates.dart';
import 'package:whatodo/Screens/Home/Intro.dart';
import 'package:whatodo/Styles.dart';

class Header extends StatelessWidget {
  final Function ref;
  final Function goSettings;
  const Header({Key? key, required this.ref, required this.goSettings})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(context.read<AppCubits>().todoList());
    // final int taskNumber = context.read<AppCubits>().todoList!.length;
    // .todoList.length;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment(-.15, -1),
          end: Alignment.bottomCenter,
          colors: [ThemeColors.blue, ThemeColors.blueDark],
          stops: [0.5, 1],
        )),
        padding: EdgeInsets.symmetric(horizontal: M),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.maxFinite, height: 5),
              Intro(ref: ref, goSettings: goSettings),
              SizedBox(height: XS + 1),
              Dates(),
              SizedBox(height: XS + 2)
            ]));
  }
}
