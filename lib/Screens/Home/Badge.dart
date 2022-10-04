// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Badge extends StatefulWidget {
  final String labelNo;
  const Badge({Key? key, required this.labelNo}) : super(key: key);

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) => Container(
      height: L - 2.7,
      width: L - 2.7,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ThemeColors.offWhite,
                spreadRadius: 0.2,
                blurRadius: XS,
                offset: const Offset(0.0, 1.0))
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ThemeColors.offWhite.withOpacity(.6),
                ThemeColors.lightGray.withOpacity(0.5)
              ])),
      child: Center(
          child: MontText(
              text: widget.labelNo,
              weight: FontWeight.w600,
              color: ThemeColors.blueBlack,
              size: S - 2)));
}
