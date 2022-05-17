// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Nav extends StatefulWidget {
  final String nav;
  final double siz;
  final dynamic fnc;
  final int version;
  Nav({
    Key? key,
    required this.nav,
    required this.siz,
    required this.fnc,
    required this.version,
  }) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.version == 1) {
      return AnimatedContainer(
        duration: Duration(
          seconds: 1,
        ),
        curve: Curves.easeInToLinear,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: S,
            ),
            InkWell(
              onTap: widget.fnc,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: M - 1.5,
                color: ThemeColors.gray,
              ),
            ),
            SizedBox(
              width: L,
            ),
            //NAV NAME
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MontText(
                  text: widget.nav.substring(0, 1),
                  weight: FontWeight.w700,
                  size: widget.siz + 4,
                  letter: -0.1,
                  color: ThemeColors.blueBlack,
                ),
                MontText(
                  text: widget.nav.substring(1, widget.nav.length),
                  weight: FontWeight.w700,
                  size: widget.siz + 1,
                  letter: -0.1,
                  color: ThemeColors.blueBlack,
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // 'ADD TODO PAGE' TYPE GO BACK WIDGET
      return AnimatedContainer(
        duration: Duration(
          seconds: 1,
        ),
        curve: Curves.easeInToLinear,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: S,
            ),
            InkWell(
              onTap: widget.fnc,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded,
                      size: M - .9,
                      color: ThemeColors.blueDark.withOpacity(.6)),
                  const SizedBox(
                    width: XS / 2 + 2.0,
                  ),
                  SansText(
                      text: widget.nav,
                      weight: FontWeight.w500,
                      size: widget.siz,
                      letter: -0.1,
                      color: ThemeColors.blueDark.withOpacity(.6)),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
