// ignore_for_file: prefer_const_constructors, file_names

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';
import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        SizedBox(height: XL),
        Padding(
          padding: const EdgeInsets.only(left: L, top: XS, right: M),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MontText(
                    text: 'Archive',
                    weight: FontWeight.w700,
                    letter: -0.5,
                    size: L + 2,
                    color: ThemeColors.blueBlack.withOpacity(.85)),
                WhiteBox(
                  child: Icon(
                      useIcon(MdiIcons.selectAll, Icons.select_all_rounded),
                      size: M,
                      color: ThemeColors.gray),
                  height: XL,
                  width: XL,
                  radius: XS - 1.5,
                  spread: 0.2,
                  blur: XS - 3,
                  shadow: ThemeColors.lightGray.withOpacity(.2),
                )
              ]),
        ),
        SizedBox(height: S),
        Line()
      ]);
}
