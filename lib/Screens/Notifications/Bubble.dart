// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Bubble extends StatefulWidget {
  final dynamic not;
  Bubble({
    Key? key,
    required this.not,
  }) : super(key: key);

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(XL, XS, L + 5, XS + 3),
            child: WhiteBox(
                height: 120,
                width: double.maxFinite,
                pad: EdgeInsets.only(
                  bottom: XS,
                  left: L,
                  right: S,
                  top: S - 1,
                ),
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
                          child: Icon(Icons.close_rounded, size: M - 2),
                        )),
                    SansText(
                      text:
                          "You ${widget.not["status"]} Reminder for '${widget.not["title"]}' at ${widget.not["time"]}.",
                      weight: FontWeight.w500,
                      color: ThemeColors.blueBlack,
                      size: S + 2,
                    ),
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
                      SizedBox(
                        width: XS - 5,
                      )
                    ])
                  ],
                )),
          ),
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
                      child: Icon(
                        Icons.format_quote_rounded,
                        size: XL - 6,
                      )))),
        ],
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:whatodo/Components/WhiteBox.dart';
// import 'package:whatodo/Styles.dart';

// class Bubble extends StatefulWidget {
//   final dynamic not;
//   Bubble({
//     Key? key,
//     required this.not,
//   }) : super(key: key);

//   @override
//   State<Bubble> createState() => _BubbleState();
// }

// class _BubbleState extends State<Bubble> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: XL - 3, vertical: XS),
//       child: Stack(children: [
//         // Positioned(
//         // top: 30,
//         // top: 0,
//         // right: -50,
//         // left: -10,
//         Positioned(
//             top: 20,
//             // margin: EdgeInsets.only(left: XL),
//             child: WhiteBox(
//                 height: XL,
//                 width: XL,
//                 // width: double.maxFinite,
//                 child: Center(
//                     child: Icon(
//                   Icons.format_quote_rounded,
//                   size: XL - 5,
//                 )))),
//         Positioned(
//           left: 50,
//           child: WhiteBox(
//               height: 100,
//               // height: double.maxFinite,
//               // width: double.maxFinite,
//               width: 300,
//               pad: EdgeInsets.only(bottom: XS),
//               child: Column(
//                   // Stack(
//                   children: [
//                     // Positioned(
//                     // top: L + 5,
//                     // child:
//                     MontText(
//                       text:
//                           "You ${widget.not["status"]} Reminder for '${widget.not["title"]}' at ${widget.not["time"]}.",
//                       weight: FontWeight.w600,
//                       color: ThemeColors.blueBlack,
//                       size: M - 2,
//                       // )
//                     ),
//                     // Positioned(
//                     // right: 0,
//                     // top: 0,
//                     // child:
//                     IconButton(
//                       icon: Icon(Icons.close_rounded),
//                       color: ThemeColors.gray,
//                       onPressed: () {},
//                       // ),
//                     ),
//                     // Positioned(
//                     // bottom: 0,
//                     // right: 0,
//                     // child:
//                     Row(children: [
//                       SansText(
//                         text: 'View Details',
//                         weight: FontWeight.w500,
//                         size: S,
//                         color: ThemeColors.blueBlack.withOpacity(.4),
//                       ),
//                       Icon(Icons.keyboard_arrow_right_rounded)
//                     ]
//                         // )
//                         ),
//                     //  WhiteBox(height: height, width: width, child: child)
//                     // ),
//                     // ],
//                   ])),
//         ),
//       ]),
//     );
//   }
// }
