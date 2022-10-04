// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:whatodo/Components/onHover.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class SeeAllBtn extends StatefulWidget {
  final List todos;
  final String title;
  const SeeAllBtn({Key? key, required this.title, required this.todos})
      : super(key: key);

  @override
  State<SeeAllBtn> createState() => _SeeAllBtnState();
}

class _SeeAllBtnState extends State<SeeAllBtn> {
  // bool col = false;
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: MouseCursor.uncontrolled,
        onEnter: (event) => onEntered(true),
        onHover: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        // Hovered(
        //     hovered: hovered,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 40.0,
            padding: EdgeInsets.only(top: XS, bottom: XS / 2),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: hovered
                    ? ThemeColors.blueOriginal.withOpacity(.8)
                    : Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: hovered
                          ? ThemeColors.blue.withOpacity(.35)
                          : Colors.white,
                      spreadRadius: 0.025,
                      blurRadius: 4)
                ]),
            child: InkWell(
                hoverColor: ThemeColors.blueOriginal.withOpacity(.4),
                onTap: () {
                  // setState(() => col = !col);
                  // setState(() => hovered = !hovered);
                  Timer(
                      Duration(milliseconds: 500),
                      () => {
                            context
                                .read<AppCubits>()
                                .seeAll(widget.title, widget.todos)
                          });
                },
                child: Column(children: [
                  Icon(useIcon(MdiIcons.mouse, Icons.mouse_rounded),
                      size: S + 1.5,
                      color: hovered ? ThemeColors.white : ThemeColors.blue),
                  SizedBox(height: 1.25),
                  SansText(
                      text: 'See All',
                      weight: FontWeight.w500,
                      size: S - 1,
                      color: hovered ? ThemeColors.white : ThemeColors.blue)
                ]))));
  }

  void onEntered(bool isHovered) {
    setState(() => hovered = isHovered);
    Future.delayed(
        Duration(milliseconds: 350), () => setState(() => hovered = false));
  }
}




// // ignore_for_file: file_names, prefer_const_constructors

// import 'package:flutter/material.dart';

// class Hovered extends StatefulWidget {
//   final Widget child;
//   bool hovered;
//   Hovered({Key? key, required this.child, required this.hovered})
//       : super(key: key);

//   @override
//   State<Hovered> createState() => _HoveredState();
// }

// class _HoveredState extends State<Hovered> {
//   // bool hovered = false;
//   @override
//   Widget build(BuildContext context) {
//     // final hoveredTransform = Matrix4.identity()..scale(1.075);
//     // final transform = hovered ? hoveredTransform : Matrix4.identity();

//     return MouseRegion(
//         cursor: MouseCursor.uncontrolled,
//         onEnter: (event) => onEntered(true),
//         onHover: (event) => onEntered(true),
//         onExit: (event) => onEntered(false),
//         child: widget.child);

//     // AnimatedContainer(
//     //     transform: transform,
//     //     duration: Duration(milliseconds: 250),
//     //     child: widget.child));
//   }

//   void onEntered(bool isHovered) => setState(() => widget.hovered = isHovered);
// }
