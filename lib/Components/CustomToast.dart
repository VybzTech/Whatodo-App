// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatodo/Styles.dart';

// class CustomToast extends StatelessWidget {
//   final IconData android;
//   final IconData ios;
//   final String msg;
//   final Color col;
//   // final ToastGravity gravity;
//   const CustomToast({
//     Key? key,
//     required this.android,
//     required this.ios,
//     required this.msg,
//     required this.col,
//     // required this.gravity
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
Widget buildToast(col, msg, android, ios) => Container(
      padding:
          EdgeInsets.only(left: M - 3, right: M, top: S - 1.5, bottom: S - 2),
      decoration: BoxDecoration(
          color: col.withOpacity(.4), borderRadius: BorderRadius.circular(XL)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            useIcon(android, ios),
            size: M - 3,
            color: col,
          ),
          SizedBox(width: S),
          Text(
            msg,
            style:
                TextStyle(color: col, fontFamily: 'Sans', fontSize: S + 1.35),
          )
        ],
      ),
    );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:whatodo/Styles.dart';

// class CustomToast extends StatefulWidget {
//   final IconData android;
//   final IconData ios;
//   final String msg;
//   final Color col;
//   final ToastGravity gravity;
//   const CustomToast(
//       {Key? key,
//       required this.android,
//       required this.ios,
//       required this.msg,
//       required this.col,
//       required this.gravity})
//       : super(key: key);

//   @override
//   State<CustomToast> createState() => _CustomToastState();
// }

// class _CustomToastState extends State<CustomToast> {
//   // final buttonStyle =
//   //     TextStyle(fontSize: S, fontFamily: 'Sans', color: ThemeColors.white);

//   final toast = FToast();

//   @override
//   void initState() {
//     super.initState();
//     toast.init(context);
//   }
// // void positionedToast(
// //     top,
// //     left,
// //     right,
//   //   bottom,
//   // ) =>
//   //     toast.showToast(
//   //         child: buildToast(),
//   //         positionedToastBuilder: (_, child) {
//   //           return Positioned(
//   //               child: child,
//   //               top: top,
//   //               left: left,
//   //               right: right,
//   //               bottom: bottom);
//   //         });

//   @override
//   Widget build(BuildContext context) {
//     // void showToast(ToastGravity gravity) =>
//     //     toast.showToast(child: buildToast(), gravity: gravity);

//     return buildToast();
//   }

//   Widget buildToast() {
//     return Container(
//       color: widget.col.withOpacity(.4),
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(XL)),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             useIcon(widget.android, widget.ios),
//             size: S,
//             color: widget.col,
//           ),
//           // ignore: prefer_const_constructors
//           SizedBox(width: S),
//           Text(
//             widget.msg,
//             // style: buttonStyle,
//           )
//         ],
//       ),
//     );
//   }

// }

// // class Toast {
// // final buttonStyle = ElevatedButton.styleFrom(
// //   minimumSize: Size(double.infinity, 50),
// //   textStyle: TextStyle(fontSize: S, fontFamily: 'Sans'));
// // }
