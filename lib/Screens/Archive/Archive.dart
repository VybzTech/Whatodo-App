// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Archive/Head.dart';
import 'package:whatodo/Styles.dart';
import 'package:whatodo/Screens/Archive/ArchiveList.dart';

class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: XL,
      ),
      Head(),
      ArchiveList(),
    ]);
  }
}
