// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Footer extends StatelessWidget {
  final bool Light;
  const Footer({Key? key, required this.Light}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: L),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'Images/VybzTech-Logo-${Light ? 'Light' : 'Dark'}.png',
            fit: BoxFit.contain,
            width: 18.5,
            height: 18.5,
          ),
          SizedBox(width: XS),
          MontText(
            text: 'Vybz Tech',
            color: Light
                ? ThemeColors.offWhite
                : ThemeColors.blueBlack.withOpacity(.8),
            weight: FontWeight.w500,
            size: S + 1,
            letter: .5,
          ),
        ],
      ),
    );
  }
}
