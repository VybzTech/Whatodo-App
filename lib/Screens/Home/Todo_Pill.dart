// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors,file_names

import 'package:whatodo/Styles.dart';
import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Home/AnimatedBtn.dart';
import 'package:whatodo/Screens/Home/Badge.dart';

class TodoPill extends StatefulWidget {
  final String title;
  final String labelNo;
  final bool togg;
  final int index;
  final dynamic callback;

  const TodoPill({
    Key? key,
    required this.title,
    required this.labelNo,
    required this.callback,
    required this.togg,
    required this.index,
  }) : super(key: key);

  @override
  State<TodoPill> createState() => _TodoPillState();
}

class _TodoPillState extends State<TodoPill> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.fromLTRB(L, 1, XS, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MontText(
                      size: M + 2,
                      text: widget.title.substring(0, 1).toUpperCase(),
                      weight: FontWeight.w600,
                      letter: -0.3,
                      color: widget.togg
                          ? ThemeColors.blueBlack.withOpacity(.85)
                          : ThemeColors.gray),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: MontText(
                        size: M - 1.5,
                        text: widget.title
                            .substring(1, widget.title.length)
                            .toUpperCase(),
                        weight: FontWeight.w600,
                        letter: -0.5,
                        color: widget.togg
                            ? ThemeColors.blueBlack.withOpacity(.85)
                            : ThemeColors.gray),
                  )
                ]),
            //BADGE & NAV
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Badge(labelNo: widget.labelNo),
                  SizedBox(width: XS),
                  AnimeBtn(
                      // ),
                      togg: widget.togg,
                      callback: widget.callback),
                  SizedBox(width: XS / 2)
                ])
          ]));
}
