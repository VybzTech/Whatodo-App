// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, curly_braces_in_flow_control_structures, file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Option.dart';
import 'package:whatodo/Components/Select.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Styles.dart';

class Priority extends StatefulWidget {
  final double siz;
  String initialValue;

  final TextEditingController control;
  Priority(
      {Key? key,
      required this.control,
      required this.initialValue,
      required this.siz})
      : super(key: key);

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  // String initialValue = 'None';

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      'None',
      'Business',
      'Low',
      'Average',
      'Casual',
      'Medium',
      'High',
      'Very High'
    ];

    final List<DropdownMenuItem> itemsList = options
        .map((prior) => DropdownMenuItem(
            value: prior,
            child: Option(
                name: prior,
                col: colorUp(prior).withOpacity(.5),
                border: colorUp(prior))))
        .toList();

    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          MontText(
              text: 'Priority',
              weight: FontWeight.w600,
              size: M - 2.75,
              letter: -0.3,
              color: widget.control.text.isNotEmpty
                  ? ThemeColors.blueBlack
                  : ThemeColors.blueBlack.withOpacity(.65)),
          WhiteBox(
              pad: EdgeInsets.only(right: XS - 2, left: XS + 3),
              spread: 1.5,
              blur: 7,
              shadow: ThemeColors.offWhite,
              radius: 5,
              height: 37,
              width: widget.siz,
              child: Select(
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(useIcon(
                        MdiIcons.chevronRight, Icons.chevron_right_rounded)),
                  ),
                  itemsList: itemsList,
                  padding: EdgeInsets.only(bottom: XS + 5),
                  options: options,
                  initialValue: widget.initialValue.isEmpty
                      ? options.first
                      : widget.initialValue,
                  onchanged: onchanged,
                  control: widget.control))
        ]));
  }

  void onchanged(dynamic val) => setState(() {
        widget.initialValue = val;
        widget.control.text = val;
      });
}
