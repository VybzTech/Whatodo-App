// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/material.dart';

class ToggleBtn extends StatefulWidget {
  const ToggleBtn({Key? key}) : super(key: key);

  @override
  _ToggleBtnState createState() => _ToggleBtnState();
}

class _ToggleBtnState extends State<ToggleBtn> {
  bool toggleVal = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 3000),
              height: 20.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: toggleVal
                      ? Colors.greenAccent[700]
                      : Colors.redAccent.withOpacity(0.5)),
              child: Stack(children: <Widget>[
                AnimatedPositioned(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.easeIn,
                    top: 3.0,
                    left: toggleVal ? 60.0 : 0.0,
                    right: toggleVal ? 0.0 : 60.0,
                    child: InkWell()),
              ]))));
}
