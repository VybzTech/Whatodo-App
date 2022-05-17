// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Settings/Settings.dart';
import 'package:whatodo/Styles.dart';

import 'MenuItems.dart';

class OverlayMenu extends StatelessWidget {
  OverlayMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay Menu"),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItem>(
              tooltip: 'App Menu',
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    ...MenuItems.main.map(buildItem).toList(),
                    PopupMenuDivider(),
                    ...MenuItems.minor.map(buildItem).toList(),
                  ])
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        //to add custom functionality on Click
        value: item,
        child: Row(children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: S + 3,
          ),
          SizedBox(width: 12),
          Text(item.text)
        ]),
      );

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.logoutSettings:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settings(),
        ));
        break;
      default:
    }
  }
}
