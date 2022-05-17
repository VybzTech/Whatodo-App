// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Archive/Archive.dart';
import 'package:whatodo/Screens/Bin/Recycle_Bin.dart';
import 'package:whatodo/Screens/Home/Todos.dart';
import 'package:whatodo/Screens/Notifications/Notification.dart';
import 'package:whatodo/Screens/Settings/Settings.dart';
import 'package:whatodo/Styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Screens = [
    {"name": "Archive", "widget": Archive(), "icon": Icons.folder_open},
    {
      "name": "Notification",
      "widget": Notifications(),
      'icon': Icons.notifications_outlined
    },
    {"name": "Todos", "widget": Todos(), "icon": Icons.format_list_numbered},
    {
      "name": "RecycleBin",
      "widget": RecycleBin(),
      "icon": Icons.delete_outline_rounded
    },
    {"name": "Settings", "widget": Settings(), 'icon': Icons.settings},
  ];

  int pageIndex = 2;

  void onTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Screens[pageIndex]);
    return Scaffold(
      body: Screens[pageIndex]["widget"],
      backgroundColor: ThemeColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: Screens.map((screen) => BottomNavigationBarItem(
            label: screen['name'], icon: Icon(screen['icon']))).toList(),
        backgroundColor: Colors.white,
        currentIndex: pageIndex,
        selectedFontSize: S - 2.0,
        unselectedFontSize: S - 4.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: ThemeColors.blueOriginal.withOpacity(0.9),
        unselectedItemColor: ThemeColors.blueBlack.withOpacity(0.2),
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        iconSize: M + 1.00,
      ),
    );
  }
}
