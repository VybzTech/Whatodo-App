// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: XL,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: L, top: XS),
                child: MontText(
                  text: 'Settings',
                  weight: FontWeight.w700,
                  size: L + 2,
                  color: ThemeColors.blueBlack.withOpacity(.85),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: M - 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageWrapper(
                  imageUrl: 'Images/Avatar.png',
                  imageHeight: 60.0,
                ),
                SizedBox(
                  height: XS / 2,
                ),
                SansText(
                  text: 'Change Avatar',
                  weight: FontWeight.w400,
                  size: S - 1,
                  color: ThemeColors.blueBlack.withOpacity(.5),
                )
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
