// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Dependencies extends StatefulWidget {
  final List<int> dep;

  const Dependencies({Key? key, required this.dep}) : super(key: key);

  @override
  State<Dependencies> createState() => _DependenciesState();
}

class _DependenciesState extends State<Dependencies> {
  @override
  Widget build(BuildContext context) {
    final depList = BlocProvider.of<AppCubits>(context).dependencies;
    setState(() {});

    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MontText(
                text: 'Is this Task Dependent on Anything',
                weight: FontWeight.w500,
                size: S,
                color: ThemeColors.blueBlack.withOpacity(.85),
                letter: -0.25),
            SansText(
                text: 'Select few',
                weight: FontWeight.w400,
                size: 9,
                color: ThemeColors.gray)
          ]),
      SizedBox(height: S),
      Container(
          height: 42,
          width: double.maxFinite,
          child: ListView.separated(
              itemCount: depList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: M / 2),
              itemBuilder: (BuildContext context, int index) {
                IconData icon = depList[index]['icon'];
                IconData AndIcon = depList[index]['AndIcon'];
                Color col = depList[index]['col'];
                return IconBtn(
                  fnc: () => widget.dep.add(index),
                  icon: icon,
                  andIcon: AndIcon,
                  col: col,
                );
              })),
      SizedBox(height: XS),
    ]);
  }
}
