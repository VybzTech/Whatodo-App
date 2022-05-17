// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Screens/Notifications/Bubble.dart';
import 'package:whatodo/Styles.dart';
// import 'package:whatodo/Styles.dart';

class Notify extends StatelessWidget {
  Notify({Key? key}) : super(key: key);

  final List notifications = [
    {
      "title": "Get Last Menu List for Tonight's Dinner",
      "time": "8:30AM",
      "status": "completed"
    },
    {"title": "Work on Sammie's Project", "time": "2:00PM", "status": "missed"},
    {"title": "Design New Logo", "time": "8:30AM", "status": "archived"},
    {
      "title": "Get Last Menu List for Tonight's Dinner",
      "time": "8:30AM",
      "status": "completed"
    },
    {
      "title": "Get  Menu List for Special Breakfast",
      "time": "3:00PM",
      "status": "completed"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Fader(
            child: ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (_, index) {
        return Bubble(not: notifications[index]);
      },
    )));
  }
}
