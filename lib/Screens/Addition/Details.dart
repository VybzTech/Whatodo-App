// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Screens/Addition/Folder.dart';
import 'package:whatodo/Screens/Addition/DueDate.dart';
import 'package:whatodo/Components/Priority.dart';
import 'package:whatodo/Screens/Addition/Radios.dart';
import 'package:whatodo/Styles.dart';

class Details extends StatefulWidget {
  final TextEditingController titleControl;
  final TextEditingController priorityControl;
  final TextEditingController folderControl;
  final TextEditingController notesControl;
  final TextEditingController dateControl;
  final TextEditingController radioControl;
  final DateTime dueDate;

  Details({
    Key? key,
    required this.dueDate,
    required this.titleControl,
    required this.notesControl,
    required this.priorityControl,
    required this.dateControl,
    required this.radioControl,
    required this.folderControl,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double selWidth = 135;
  @override
  Widget build(BuildContext context) => Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: XS, right: XS),
      child: Column(children: [
        Input(
            hint: 'Create a Todo Name',
            prefixSize: M - 3,
            prefixIcon: useIcon(
                MdiIcons.formatListBulleted, Icons.format_list_bulleted),
            controller: widget.titleControl,
            version: 1),
        SizedBox(height: M + 5),
        Folder(control: widget.folderControl, siz: selWidth),
        SizedBox(height: S),
        Priority(
            initialValue: 'None',
            control: widget.priorityControl,
            siz: selWidth),
        SizedBox(height: S),
        DueDate(
            control: widget.dateControl,
            siz: selWidth,
            dueDate: widget.dueDate),
        SizedBox(height: M),
        Input(
            hint: 'Write some Notes...',
            prefixIcon: useIcon(MdiIcons.bookEdit, Icons.edit_note_sharp),
            controller: widget.notesControl,
            height: 130,
            version: 1),
        SizedBox(height: S),
        Radios(control: widget.radioControl),
        SizedBox(height: XS),
      ]));
}
