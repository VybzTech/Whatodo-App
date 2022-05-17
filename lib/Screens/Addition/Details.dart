// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Screens/Addition/DueDate.dart';
import 'package:whatodo/Screens/Addition/Priority.dart';
import 'package:whatodo/Screens/Addition/Radios.dart';
import 'package:whatodo/Styles.dart';

class Details extends StatefulWidget {
  late String taskName;
  late String notes;
  Details({Key? key, required this.notes, required this.taskName
      // required this.detail
      })
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final taskNameController = TextEditingController();
  final notesController = TextEditingController();
  // late String taskName = taskNameController.text.trim();

  @override
  Widget build(BuildContext context) {
    widget.taskName = taskNameController.text.trim();
    widget.notes = notesController.text.trim();
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: S, right: S, top: XS - 3),
      child: Column(
        children: [
          Input(
            controller: taskNameController,
            hint: 'Create a TaskName',
            prefixed: true,
            prefixSize: M - 3,
            prefixIcon: Icons.format_list_bulleted,
            suffixIcon: Icon(
              Icons.error,
              size: M,
            ),
            // error: 'Try Adding more than * characters',
          ),
          SizedBox(
            height: M + 5,
          ),
          Priority(),
          SizedBox(
            height: M - 5,
          ),
          Date(),
          SizedBox(
            height: M + 7,
          ),
          Input(
            controller: notesController,
            hint: 'Write some Notes...',
            prefixIcon: Icons.edit_outlined,
            prefixSize: M - 1,
            high: 5,
          ),
          Radios(),
          SizedBox(
            height: M,
          ),
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    // widget.detail = taskName;
  }
}
