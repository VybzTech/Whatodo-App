// ignore_for_file: prefer_const_constructors,file_names
import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Notifications/Head.dart';
// import 'package:whatodo/Screens/Notifications/Notification_List.dart';
import 'package:whatodo/Styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: XL),
            Head(),
            // Notify(),
          ]);
}
