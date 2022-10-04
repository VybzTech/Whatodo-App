// ignore_for_file: prefer_const_constructors, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/NamedNav.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class SeeAllHead extends StatefulWidget {
  final String title;
  final int no;
  final bool grid;
  final Function setGrid;
  const SeeAllHead(
      {Key? key,
      required this.title,
      required this.grid,
      required this.setGrid,
      required this.no})
      : super(key: key);

  @override
  State<SeeAllHead> createState() => _SeeAllHeadState();
}

class _SeeAllHeadState extends State<SeeAllHead> {
  // DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     now = DateTime.now();
    //   });
    // });
  }

  // @override
  // void dispose() {
  //   // timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Nav(
              nav: widget.title.toUpperCase(),
              siz: M,
              color: ThemeColors.gray,
              version: 1,
              fnc: () => BlocProvider.of<AppCubits>(context).goHome()),
          Row(children: [
            SquareBtn(
                col: ThemeColors.blueDark,
                fnc: widget.setGrid,
                size: XL,
                child: Icon(
                    widget.grid
                        ? useIcon(MdiIcons.grid, Icons.grid_view_rounded)
                        : useIcon(MdiIcons.formatListBulleted,
                            Icons.format_list_bulleted_rounded),
                    color: ThemeColors.offWhite)),
            SizedBox(width: L - 2),
          ])
        ]),
        Container(
            padding: EdgeInsets.only(top: XS, left: L, right: L - 4),
            // padding: EdgeInsets.only(top: M - 2, left: L, right: L - 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SansText(
                    text:
                        '${widget.no} Task${plural(widget.no)} ${widget.title}',
                    weight: FontWeight.w500,
                    color: ThemeColors.blueBlack.withOpacity(.65),
                    size: M - 2.75,
                  ),
                  SansText(
                      text: DateFormat('HH:mm').format(DateTime.now()),
                      weight: FontWeight.w400,
                      color: ThemeColors.gray.withOpacity(.65),
                      size: S + 4,
                      letter: 1.25)
                ])),
        SizedBox(height: S),
      ]);
}
