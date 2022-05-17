// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class TaskDep extends StatelessWidget {
  const TaskDep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: XS - 2, bottom: XS - 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic_none_rounded,
                    color: Colors.teal,
                    size: M - 1,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.paid_rounded,
                    color: Colors.lightGreenAccent[700],
                    size: M - 1,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.phone_enabled_rounded,
                    color: Colors.greenAccent,
                    size: M - 1,
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MontText(
                text: 'Thur, 13th Mar',
                weight: FontWeight.w600,
                color: ThemeColors.blueBlack.withOpacity(.65),
                size: S + 2,
              ),
              SizedBox(height: 3),
              SansText(
                text: 'Date Created',
                weight: FontWeight.w400,
                color: ThemeColors.gray.withOpacity(.7),
                size: S - 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
