// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  String user = 'David';
  int taskNumber = 3;

  @override
  Widget build(BuildContext context) {
    var plural = taskNumber > 1 ? 's' : '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: XS,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MontText(
                  text: 'Good Morning',
                  size: M - 1.0,
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  width: 5.5,
                ),
                MontText(
                  text: user,
                  size: M + 2.0,
                  weight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(
              height: 2.5,
            ),
            SansText(
              text: 'You have $taskNumber pending task$plural',
              size: S + 0.7,
              weight: FontWeight.w400,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ImageWrapper(
            imageUrl: 'Images/Avatar.png',
            imageHeight: 57.0,
            bordered: true,
          ),
        ),
      ],
    );
  }
}
