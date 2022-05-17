import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MontText(
          text: 'Due Date',
          weight: FontWeight.w500,
          size: M - 3,
          color: ThemeColors.blueBlack,
        ),
        WhiteBox(
            pad: const EdgeInsets.only(left: S),
            radius: 5,
            spread: 1.5,
            blur: 7,
            shadow: ThemeColors.offWhite,
            height: 35,
            width: 125,
            child: Row(
              children: [
                SansText(
                  text: '3rd Mar, 2022',
                  weight: FontWeight.w500,
                  color: ThemeColors.gray,
                  size: S,
                )
              ],
            )),
      ],
    );
  }
}
