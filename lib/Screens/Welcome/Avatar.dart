// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: XL * 1.5,
          height: XL * 1.5,
          decoration: BoxDecoration(
            color: ThemeColors.offWhite.withOpacity(.8),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.inner,
                  blurRadius: 20,
                  color: Color(0x77111111),
                  spreadRadius: 2,
                  offset: Offset(0, -3))
            ],
          ),
          child: Center(
            child: SansText(
                text: '?',
                weight: FontWeight.w400,
                color: ThemeColors.blueBlack,
                size: L + 3),
          ),
        ),
        SizedBox(height: 3),
        RichText(
            text: TextSpan(
                text: 'Select Avatar',
                style: TextStyle(
                    fontSize: S - 1.5,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    color: ThemeColors.blueBlack.withOpacity(.65))))
      ],
    );
  }
}
