// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Footer.dart';
import 'package:whatodo/Screens/Welcome/FormModal.dart';
import 'package:whatodo/Styles.dart';

import 'Avatar.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(M * 1.5, L, M * 1.5, XS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Avatar(),
            FormModal(),
            Footer(
              Light: false,
            ),
          ],
        ));
  }
}
