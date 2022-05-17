// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: L),
              child: MontText(
                text: 'Archive',
                weight: FontWeight.w800,
                size: L + 2,
                color: ThemeColors.blueBlack.withOpacity(.85),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: M),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WhiteBox(
                      child: Icon(
                        Icons.archive,
                        size: M,
                        color: ThemeColors.gray,
                      ),
                      height: XL,
                      width: XL,
                      radius: XS - 1.5,
                      spread: 0.2,
                      blur: XS - 3,
                      shadow: ThemeColors.lightGray.withOpacity(.2),
                    ),
                    SizedBox(
                      width: XS,
                    ),
                    WhiteBox(
                      child: Icon(
                        Icons.select_all,
                        size: M,
                        color: ThemeColors.gray,
                      ),
                      height: XL,
                      width: XL,
                      radius: XS - 1.5,
                      spread: 0.2,
                      blur: XS - 3,
                      shadow: ThemeColors.lightGray.withOpacity(.2),
                    )
                  ]),
            ),
          ],
        ),
        SizedBox(
          height: M,
        ),
        Line(),
      ],
    );
  }
}
