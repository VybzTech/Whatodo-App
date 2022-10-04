// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class SeeAllGraph extends StatelessWidget {
  const SeeAllGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteBox(
        marg: EdgeInsets.symmetric(horizontal: L, vertical: S),
        height: XL * 3,
        spread: 0.35,
        shadow: ThemeColors.lightGray.withOpacity(.6),
        width: double.maxFinite,
        child: Center(child: Text("60% GRAPH TEMPLATE")));
  }
}
