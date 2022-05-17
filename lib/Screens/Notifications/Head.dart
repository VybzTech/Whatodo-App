// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Head extends StatelessWidget {
  const Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: L, top: XS),
              child: MontText(
                text: 'Notifications',
                weight: FontWeight.w700,
                size: L + 2,
                color: ThemeColors.blueBlack.withOpacity(.85),
              ),
            ),
            Container(
                constraints: const BoxConstraints(maxWidth: XL, maxHeight: XL),
                decoration: BoxDecoration(
                    color: ThemeColors.blueOriginal,
                    borderRadius: BorderRadius.circular(7)),
                margin: const EdgeInsets.only(right: M),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: M - 2,
                  color: ThemeColors.offWhite,
                  hoverColor: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_rounded),
                )),
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
