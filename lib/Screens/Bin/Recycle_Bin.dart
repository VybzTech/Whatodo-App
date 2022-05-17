// ignore_for_file:file_names prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Bin/BinList.dart';
import 'package:whatodo/Screens/Bin/SearchBin.dart';
import 'package:whatodo/Styles.dart';

class RecycleBin extends StatefulWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  _RecycleBinState createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Column(children: [
      SizedBox(
        height: XL,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: L, top: XS),
            child: MontText(
              text: 'Recycle Bin',
              weight: FontWeight.w700,
              size: L + 2,
              color: ThemeColors.blueBlack.withOpacity(.85),
            ),
          ),
        ],
      ),
      SearchBin(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: XL, vertical: M),
        child: SansText(
          size: S,
          text:
              'Todos are available for 30 days after deletion. After a month, respective Todos qill be permanently deleted.',
          weight: FontWeight.w600,
          color: ThemeColors.blueBlack.withOpacity(.35),
        ),
      ),
      BinList(),
    ]);
  }
}
