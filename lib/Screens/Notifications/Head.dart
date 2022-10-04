// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  child: MontText(
                      text: 'Notifications',
                      weight: FontWeight.w700,
                      size: L + 2,
                      letter: -0.5,
                      color: ThemeColors.blueBlack.withOpacity(.85)),
                  padding: const EdgeInsets.only(left: L, top: XS)),
              Container(
                  constraints:
                      const BoxConstraints(maxWidth: XL, maxHeight: XL),
                  margin: const EdgeInsets.only(right: M),
                  decoration: BoxDecoration(
                      color: ThemeColors.blueOriginal,
                      borderRadius: BorderRadius.circular(7)),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: M - 2,
                      color: ThemeColors.offWhite,
                      hoverColor: Colors.white,
                      onPressed: () {},
                      icon: Icon(useIcon(MdiIcons.bellRing,
                          Icons.notifications_active_rounded)))),
            ]),
            SizedBox(height: M),
            // Line()
          ]);
}
