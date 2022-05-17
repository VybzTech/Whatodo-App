// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Home/FIlter.dart';
import 'package:whatodo/Styles.dart';

class AnimeBtn extends StatefulWidget {
  final bool toggleList;
  final Function callback;
  final int pillNo;
  const AnimeBtn({
    Key? key,
    required this.pillNo,
    required this.toggleList,
    required this.callback,
  }) : super(key: key);

  @override
  State<AnimeBtn> createState() => _AnimeBtnState();
}

class _AnimeBtnState extends State<AnimeBtn>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<Color> animation2;
  late AnimationController _controller;

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    final col = ThemeColors.blueBlack.withOpacity(.7);
    animation1 = Tween<double>(begin: 0, end: angle).animate(_controller);
    animation2 = Tween<Color>(begin: ThemeColors.lightGray, end: col)
        .animate(_controller);
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    setRotation(90);
    // SET INITIAL LISTED FILTER TO ROTATE
    if (widget.toggleList) {
      _controller.forward(from: 0);
    }
  }

//DISPOSE THE CONTROLLER FOR INIT STATE
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation1,
        child: IconButton(
          color: widget.toggleList
              ? ThemeColors.blueBlack.withOpacity(.7)
              : ThemeColors.lightGray,
          iconSize: M * 1.5,
          icon: Icon(Icons.keyboard_arrow_right_rounded),
          onPressed: () {
            widget.callback(widget.pillNo);
            widget.toggleList
                ? _controller.reverse(from: 0)
                : _controller.forward(from: 0);
          },
        ),
        builder: (context, child) {
          return Transform.rotate(angle: animation1.value, child: child);
        });
  }
}



                    // AnimatedRotation(
                    //   turns: turn,
                    //   duration: Duration(milliseconds: 700),
                    //   child: IconButton(
                    //     icon: Icon(Icons.keyboard_arrow_up_rounded),
                    //     onPressed: () {
                    //       turn == 2 ? turn -= 2.0 : turn += 2.0;
                    //     },
                    //   ),
                    // ),
                    
//  RotatedBox(
                //   quarterTurns: rotate ? 2 : 0,
                //   child: IconButton(
                //       onPressed: () {
                //         setState(() {
                //           rotate = !rotate;
                //         });
                //       },
                //       icon: Icon(Icons.keyboard_arrow_up_rounded)),
                // ),

//CHECK STATUS OF YOUR CONTROLLER & RESET
//controller.addListener((status) => {
// if(status==AnimationStatus.completed){await Future.delayed(Duration(seconds: 1));_controller.reset();}
//     });


// AnimatedContainer(
    //   duration: Duration(milliseconds: 5000),
    //   curve: Curves.easeInOut,
    //   transform: Matrix4.rotationX(270.0),
    //   child: Transform.rotate(
    //     angle: (pi / 180) * 0,
    //     // angle: (pi / 180) * (widget.toggleList ? 90 : 0),
    //     child: AnimatedIcon(
    //       progress: animation1,
    //       // child: IconButton(

    //       // padding: EdgeInsets.zero,
    //       // constraints: BoxConstraints(maxHeight: M * 2, minWidth: XL),
    //       // iconSize: M * 1.5,
    //       size: M * 1.5,
    //       color: widget.toggleList
    //           ? ThemeColors.blueBlack.withOpacity(.7)
    //           : ThemeColors.lightGray,
    //       // focusColor: ThemeColors.gray,
    //       // hoverColor: ThemeColors.gray,
    //       // icon: Icon(Icons.keyboard_arrow_right_rounded),
    //       icon: AnimatedIcons.menu_arrow,
    //       // onPressed: () {
    //       //   // widget.callback(widget.pillNo);
    //       //   if (reverse == false) {
    //       //     AnimationController.forward();
    //       //   } else {
    //       //     AnimationController.reverse();
    //       //     reverse = !reverse;
    //       //   }
    //       // },
    //     ),
    //   ),
    // );