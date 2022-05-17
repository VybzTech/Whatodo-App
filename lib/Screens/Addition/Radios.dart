// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

enum TodoTime { recurring, periodic }

class Radios extends StatefulWidget {
  const Radios({Key? key}) : super(key: key);

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  TodoTime? _timely = TodoTime.periodic;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - (L * 2.3);
    double height = 50.0;
    const active = Color(0xFF40B5F8);
    return SizedBox(
      width: double.maxFinite,
      // height: XL * 2.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Center(
                child: RadioListTile<TodoTime>(
              dense: true,
              activeColor: active,
              groupValue: _timely,
              value: TodoTime.recurring,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Recurring Task',
                style: TextStyle(fontSize: S + 1),
              ),
              onChanged: (TodoTime? value) {
                setState(() {
                  _timely = value;
                });
              },
              //  SansText(
              //   text: 'Recurring Task',
              //   weight: FontWeight.w500,
              //   color: ThemeColors.gray,
              //   letter: 0.05,
              //   size: S,
              // ),
            )),
          ),
          SizedBox(
            width: width,
            height: height,
            child: RadioListTile<TodoTime>(
              dense: true,
              activeColor: active,
              groupValue: _timely,
              value: TodoTime.periodic,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Periodic Task',
                style: TextStyle(fontSize: S + 1),
              ),
              onChanged: (TodoTime? value) {
                setState(() {
                  _timely = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
