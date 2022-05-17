// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class GridTemp extends StatelessWidget {
  final String text;
  const GridTemp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: XS),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ThemeColors.offWhite,
              spreadRadius: 0.35,
              blurRadius: 7,
            )
          ],
          border: Border.all(
              color: ThemeColors.lightGray.withOpacity(.5), width: 1.5),
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              // Icons.folder_open_rounded,
              Icons.folder_open_rounded,
              color: Colors.amber[700],
              size: M * 2.2,
            ),
            SizedBox(
              height: XS,
            ),
            SansText(
              text: 'text',
              weight: FontWeight.w500,
              color: ThemeColors.blueBlack,
              size: M,
            ),
            SansText(
              text: 'text',
              weight: FontWeight.w300,
              color: ThemeColors.lightGray,
              size: S,
            )
          ],
        ),
      ),
    );
  }
}
