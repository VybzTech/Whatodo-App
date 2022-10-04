// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class EmptyBox extends StatelessWidget {
  final String pillName;
  EmptyBox({
    Key? key,
    required this.pillName,
  }) : super(key: key);

  List<String> evicted = ['upcoming', 'overdue'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: L, vertical: M),
      child: Center(
        child: Row(
          children: [
            Icon(
              useIcon(MdiIcons.emoticonConfusedOutline,
                  Icons.emoji_emotions_rounded),
              size: XL + XS,
              color: ThemeColors.blueOriginal.withOpacity(0.7),
              shadows: [
                BoxShadow(
                    color: ThemeColors.lightGray.withOpacity(.6),
                    offset: Offset(0.5, 2),
                    blurRadius: XS,
                    spreadRadius: XS + 3,
                    blurStyle: BlurStyle.normal)
              ],
            ),
            SizedBox(width: S - 3),
            SansText(
              text:
                  'There are no Tasks${evicted.contains(pillName.toLowerCase()) ? '' : ' for'} $pillName',
              weight: FontWeight.w400,
              color: ThemeColors.blueOriginal,
              size: M - 4,
            )
          ],
        ),
      ),
    );
  }
}
