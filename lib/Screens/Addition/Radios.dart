// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, curly_braces_in_flow_control_structures, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

enum TodoTime { periodic, recurring }

class Radios extends StatefulWidget {
  final TextEditingController control;

  const Radios({Key? key, required this.control}) : super(key: key);
  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  TodoTime? _timely = TodoTime.periodic;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - (XL);
    double height = 50.0;
    const active = Color(0xFF297EFD);
    return SizedBox(
        width: double.maxFinite,
        // height: XL * 2.2,
        height: height,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: width,
                  height: height,
                  child: RadioListTile<TodoTime>(
                    dense: true,
                    activeColor: active,
                    groupValue: _timely,
                    value: TodoTime.periodic,
                    contentPadding: EdgeInsets.only(bottom: 5),
                    selectedTileColor: ThemeColors.blueDark.withOpacity(.6),
                    title: Text('Periodic Task',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'San',
                            fontSize: S + 1.5,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.blueBlack.withOpacity(.85))),
                    onChanged: onChanged,
                  )),
              SizedBox(
                  width: width,
                  height: height,
                  child: RadioListTile<TodoTime>(
                    dense: true,
                    activeColor: active,
                    groupValue: _timely,
                    value: TodoTime.recurring,
                    contentPadding: EdgeInsets.zero,
                    selectedTileColor: ThemeColors.blueDark.withOpacity(.4),
                    title: Text('Recurring Task',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'San',
                            fontSize: S + 1.5,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.blueBlack.withOpacity(.85))),
                    onChanged: onChanged,
                  )),
              SizedBox(width: 5)
            ]));
  }

  onChanged(TodoTime? val) {
    if (val == TodoTime.recurring) {
      setState(() {
        _timely = val;
        widget.control.text = val!.name;
      });
    } else {
      setState(() {
        _timely = val;
        widget.control.text = val!.name;
      });
    }
  }
}
