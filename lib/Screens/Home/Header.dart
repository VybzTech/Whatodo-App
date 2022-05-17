// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Screens/Home/Dates.dart';
import 'package:whatodo/Screens/Home/Intro.dart';
import 'package:whatodo/Styles.dart';

class Header extends StatefulWidget {
  final double height;
  final Color begin;
  final Color end;
  final bool dated;

  const Header({
    Key? key,
    required this.height,
    required this.begin,
    required this.end,
    required this.dated,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(-0.4, -1),
        end: Alignment.bottomCenter,
        colors: [widget.begin, widget.end],
        stops: const [0.5, 1],
      )),
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(M + 3, XS, M, XS),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: M,
              child: Container(),
            ),
            Intro(),
            widget.dated
                ? Dates()
                : SizedBox(
                    height: S,
                  ),
          ],
        ),
        //OPTIONS BUTTON
        Positioned(
            right: -3,
            top: 24,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(XL * 2),
                color: hovered
                    ? ThemeColors.blueDark.withOpacity(.65)
                    : ThemeColors.blueDark.withOpacity(.005),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints.tight(Size(28, 28)),
                iconSize: M - 3,
                color: ThemeColors.whitishBlue,
                focusColor: ThemeColors.whitishBlue,
                hoverColor: Colors.white,
                icon: Icon(
                  Icons.more_vert_rounded,
                ),
                onPressed: () {
                  setState(() {
                    hovered = true;
                  });
                  var timer = Timer(
                      Duration(milliseconds: 1700),
                      () => setState(() {
                            hovered = false;
                          }));
                },
              ),
            )),
      ]),
    );
  }
}
/*
class AppsIntro extends StatelessWidget {
  const AppsIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment(-0.4, -1),
          end: Alignment.bottomCenter,
          colors: [ThemeColors.blue, ThemeColors.blueDark],
          stops: const [0.5, 1],
        )),
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(M + 3, M + 3, M + 3, XS),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.maxFinite,
                  height: M,
                  child: Stack(children: [
                    Positioned(
                        right: -M,
                        bottom: -20,
                        child: IconButton(
                          iconSize: M - 2,
                          color: ThemeColors.whitishBlue.withOpacity(0.85),
                          focusColor: ThemeColors.whitishBlue,
                          hoverColor: Colors.white,
                          icon: Icon(
                            Icons.segment_outlined,
                          ),
                          onPressed: () {},
                        )),
                  ])),
              Intro(),
            ]));
  }
}

return Scaffold(
      appBar: AppBar(title: Text('Test Tile')),
      body: Expanded(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: Text('Secondary Test'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => ListTile(
                  title: Text('Item $i'),
                ),
                childCount: 1,
              ),
            )
          ],
        ),
      ),
      // AppsIntro(),
    );

*/