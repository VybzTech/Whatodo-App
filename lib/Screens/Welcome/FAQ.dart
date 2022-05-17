// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class FAQ extends StatelessWidget {
  FAQ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Column(
        children: [
          SizedBox(height: XL + S),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageWrapper(
                  imageHeight: 57,
                  imageUrl: 'Images/Avatar.png',
                ),
                Column(
                  children: [
                    SizedBox(height: S),
                    MontText(
                      text: 'Welcome Esteemed User',
                      weight: FontWeight.w600,
                      size: M - 2,
                      color: ThemeColors.blueBlack,
                    ),
                  ],
                ),
                IconBtn(
                    icoSize: 27,
                    tip: 'Back',
                    fnc: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: Icons.chevron_left_rounded,
                    sel: false)
              ]),
          SizedBox(height: M),
          MontText(
            text: "WHAT IS THE WHA'TODO APP",
            weight: FontWeight.w900,
            size: L - 4,
            color: ThemeColors.blueBlack,
            letter: -0.15,
          ),
        ],
      ),
    );
    // Container(
  }
}
