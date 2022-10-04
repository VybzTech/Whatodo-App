// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Bubble extends StatefulWidget {
  final dynamic not;
  const Bubble({
    Key? key,
    required this.not,
  }) : super(key: key);

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) => Container(
      width: double.maxFinite,
      child: Stack(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(XL, XS, L + 5, XS + 3),
            child: WhiteBox(
                height: 120,
                width: double.maxFinite,
                pad: EdgeInsets.only(bottom: XS, left: L, right: S, top: S - 1),
                blur: XS / 2,
                radius: S + 2,
                shadow: ThemeColors.lightGray.withAlpha(100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SquareBtn(
                          size: L,
                          col: ThemeColors.blueBlack.withOpacity(.1),
                          fnc: () {},
                          child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Icon(Icons.close_rounded, size: M - 2))),
                      SansText(
                          text:
                              "You ${widget.not["status"]} Reminder for '${widget.not["title"]}' at ${widget.not["time"]}.",
                          weight: FontWeight.w500,
                          color: ThemeColors.blueBlack,
                          size: S + 2),
                      SizedBox(height: XS),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        SansText(
                          text: 'View Details',
                          weight: FontWeight.w500,
                          size: S - 1.5,
                          color: ThemeColors.blueBlack.withOpacity(.4),
                        ),
                        Icon(Icons.keyboard_arrow_right_rounded,
                            color: ThemeColors.blueBlack.withOpacity(.4),
                            size: M - 1),
                        SizedBox(width: XS - 5)
                      ])
                    ]))),
        Positioned(
            top: XL + 5,
            left: S + 5,
            child: WhiteBox(
                height: XL,
                width: XL,
                blur: XS / 2,
                radius: XS,
                shadow: ThemeColors.lightGray.withAlpha(100),
                child: RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.format_quote_rounded, size: XL - 6)))),
      ]));
}
