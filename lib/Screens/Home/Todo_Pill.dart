// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Home/AnimatedBtn.dart';
import 'package:whatodo/Screens/Home/Badge.dart';
import 'package:whatodo/Styles.dart';

class TodoPill extends StatefulWidget {
  final String title;
  final String labelNo;
  final int pillNo;
  bool toggleList;
  final Function callback;

  TodoPill({
    Key? key,
    required this.callback,
    required this.title,
    required this.labelNo,
    required this.pillNo,
    this.toggleList = false,
  }) : super(key: key);

  @override
  State<TodoPill> createState() => _TodoPillState();
}

class _TodoPillState extends State<TodoPill> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //LITTLE EDIT TO REMOVE FIRST TODOPILL TOP-PADDING
      padding: EdgeInsets.fromLTRB(L, widget.pillNo == 0 ? 0 : XS, XS, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //FILTER TITLES
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MontText(
                  text: widget.title.substring(0, 1).toUpperCase(),
                  weight: FontWeight.w600,
                  color: widget.toggleList
                      ? ThemeColors.blueBlack
                      : ThemeColors.gray,
                  size: M + 1,
                ),
                MontText(
                  text: widget.title
                      .substring(1, widget.title.length)
                      .toUpperCase(),
                  weight: FontWeight.w600,
                  color: widget.toggleList
                      ? ThemeColors.blueBlack
                      : ThemeColors.gray,
                  size: M - 1.5,
                ),
              ]),
          //BADGE & NAV
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Badge(labelNo: widget.labelNo.toString()),
              SizedBox(
                width: XS,
              ),
              AnimeBtn(
                  pillNo: widget.pillNo,
                  toggleList: widget.toggleList,
                  callback: widget.callback),
              SizedBox(
                width: XS,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
