// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({required this.icon, required this.text});
}

class MenuItems {
  static const List<MenuItem> main = [
    itemSettings,
    shareSettings,
  ];
  static const List<MenuItem> minor = [
    logoutSettings,
  ];

  static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const shareSettings = MenuItem(text: 'Share', icon: Icons.share);
  static const logoutSettings =
      MenuItem(text: 'Log Out', icon: Icons.logout_rounded);
}
