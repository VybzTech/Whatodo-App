// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class SearchBin extends StatefulWidget {
  const SearchBin({Key? key}) : super(key: key);

  @override
  State<SearchBin> createState() => _SearchBinState();
}

class _SearchBinState extends State<SearchBin> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: XL, vertical: S + 5),
      child: WhiteBox(
          height: XL,
          shadow: ThemeColors.lightGray.withOpacity(.5),
          spread: 0.025,
          blur: XS,
          width: double.maxFinite,
          child: Input(
              version: 1,
              controller: searchController,
              align: TextAlign.center,
              hint: 'Type Todo Keywords',
              prefixIcon: Icons.search_rounded,
              prefixSize: M)));
}
