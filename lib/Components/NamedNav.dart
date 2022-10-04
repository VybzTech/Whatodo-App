// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class Nav extends StatefulWidget {
  final String nav;
  final double siz;
  final dynamic fnc;
  final int version;
  final Color color;
  const Nav({
    Key? key,
    required this.nav,
    required this.siz,
    required this.fnc,
    required this.version,
    required this.color,
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
        duration: Duration(seconds: 1),
        curve: Curves.easeInToLinear,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: XS / 2),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: IconBtn(
                  fnc: widget.fnc,
                  col: ThemeColors.gray,
                  icoSize: 27,
                  andIcon: MdiIcons.chevronLeft,
                  icon: Icons.chevron_left_rounded),
            ),
            SizedBox(width: 1),
            //NAV NAME
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MontText(
                  text: widget.nav.substring(0, 1),
                  weight: FontWeight.w700,
                  size: widget.siz + 4.5,
                  letter: -0.1,
                  color: ThemeColors.blueBlack.withOpacity(.7),
                ),
                MontText(
                  text: widget.nav.substring(1, widget.nav.length),
                  weight: FontWeight.w700,
                  size: widget.siz + 1,
                  letter: -0.1,
                  color: ThemeColors.blueBlack.withOpacity(.7),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // 'ADDTODO PAGE' TYPE GO BACK WIDGET
      return AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInToLinear,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: S),
                InkWell(
                    radius: S,
                    onDoubleTap: widget.fnc,
                    onTap: () {
                      setState(() => isHovered = !isHovered);
                      Timer(Duration(milliseconds: 250), () => widget.fnc());
                    },
                    borderRadius: BorderRadius.circular(XS),
                    splashColor: ThemeColors.whitishBlue.withOpacity(.25),
                    highlightColor: ThemeColors.whitishBlue.withOpacity(.25),
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(children: [
                          Icon(
                              useIcon(MdiIcons.chevronLeft,
                                  Icons.arrow_back_ios_new_rounded),
                              size: M,
                              color: isHovered
                                  ? widget.color
                                  // ? ThemeColors.blueDark.withOpacity(.6)
                                  : ThemeColors.gray.withOpacity(.6)),
                          const SizedBox(width: XS / 2),
                          SansText(
                              text: widget.nav,
                              weight: FontWeight.w500,
                              size: widget.siz,
                              letter: -0.1,
                              color: isHovered
                                  ? widget.color
                                  : ThemeColors.gray.withOpacity(.6)),
                        ])))
              ]));
    }
  }
}
