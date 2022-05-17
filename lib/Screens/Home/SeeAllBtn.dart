// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class SeeAllBtn extends StatefulWidget {
  final int index;
  const SeeAllBtn({Key? key, required this.index}) : super(key: key);

  @override
  State<SeeAllBtn> createState() => _SeeAllBtnState();
}

class _SeeAllBtnState extends State<SeeAllBtn> {
  bool col = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: XS, bottom: XS / 2),
      height: 40.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: col ? ThemeColors.blueOriginal.withOpacity(.8) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: col ? ThemeColors.blue.withOpacity(.35) : Colors.white,
            spreadRadius: 0.025,
            blurRadius: 4,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            col = !col;
          });
          Timer(Duration(milliseconds: 350),
              () => {context.read<AppCubits>().seeAll(widget.index)});
        },
        child: Column(
          children: [
            Icon(
              Icons.mouse_rounded,
              size: S + 1.5,
              color: col ? ThemeColors.white : ThemeColors.blue,
            ),
            SizedBox(
              height: 1.25,
            ),
            SansText(
              text: 'See All',
              weight: FontWeight.w500,
              color: col ? ThemeColors.white : ThemeColors.blue,
              size: S - 1,
            )
          ],
        ),
        hoverColor: ThemeColors.blueOriginal.withOpacity(.4),
      ),
    );
  }
}
