// ignore_for_file: file_names, prefer_const_constructors, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class AnimeBtn extends StatefulWidget {
  final bool togg;
  final Function callback;
  const AnimeBtn({
    Key? key,
    required this.togg,
    required this.callback,
  }) : super(key: key);

  @override
  State<AnimeBtn> createState() => _AnimeBtnState();
}

class _AnimeBtnState extends State<AnimeBtn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation1;
  late Animation<Color> animation2;
  bool clicked = false;
  double angle = (90 * pi) / 180;
  final col = ThemeColors.blueBlack.withOpacity(.7);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animation1 = Tween<double>(begin: 0.0, end: angle).animate(_controller);
    animation2 = Tween<Color>(begin: ThemeColors.lightGray, end: col)
        .animate(_controller);
  }

  // void setRotation(int degrees) {
  //   final angle = degrees * pi / 180;
  //   final col = ThemeColors.blueBlack.withOpacity(.7);
  //   animation1 = Tween<double>(begin: 0, end: angle).animate(_controller);
  //   animation2 = Tween<Color>(begin: ThemeColors.lightGray, end: col)
  //       .animate(_controller);
  // }

  @override
  Widget build(BuildContext context) {
    widget.togg
        ? _controller.forward(from: 0)
        : _controller.reverse(from: angle);
    return AnimatedBuilder(
        animation: animation1,
        child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: widget.togg
                ? ThemeColors.blueBlack.withOpacity(.7)
                : ThemeColors.lightGray,
            iconSize: M * 1.4,
            icon: Icon(useIcon(
                MdiIcons.chevronRight, Icons.keyboard_arrow_right_rounded)),
            onPressed: () => widget.callback()),
        builder: (context, child) {
          return Transform.rotate(angle: animation1.value, child: child);
        });
  }

// DISPOSE THE CONTROLLER FOR INIT STATE
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
