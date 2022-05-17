// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class ListTemp extends StatelessWidget {
  final String text;
  const ListTemp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: XS),
      padding: EdgeInsets.only(top: S, bottom: S - 2.5, left: S, right: M),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ThemeColors.offWhite,
              spreadRadius: 0.15,
              blurRadius: XS,
            )
          ],
          border: Border.all(
              color: ThemeColors.lightGray.withOpacity(.25), width: 1.5),
          borderRadius: BorderRadius.circular(XS + 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //ICON & TODO TITTLE 'n' SUBTASKS
          Row(
            children: [
              Icon(
                Icons.folder_open_rounded,
                color: Colors.cyanAccent[700],
                size: L,
              ),
              SizedBox(
                width: S,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SansText(
                    text: 'Some Todo to Do',
                    weight: FontWeight.w500,
                    color: ThemeColors.blueBlack,
                    size: S + 3,
                  ),
                  SansText(
                    text: 'text',
                    weight: FontWeight.w300,
                    color: ThemeColors.gray.withOpacity(.7),
                    size: S,
                  )
                ],
              ),
            ],
          ),
          //SUBTASK PROGRESS INDICATOR
          Column(
            children: [
              SansText(
                text: '1/3',
                weight: FontWeight.w500,
                color: Colors.cyan,
                size: S + 2,
              ),
              Container(
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent[300],
                    borderRadius: BorderRadius.circular(2)),
                child: Container(
                  color: Colors.cyanAccent[900],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
