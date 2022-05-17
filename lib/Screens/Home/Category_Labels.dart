// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class CategoryLabel extends StatefulWidget {
  List categories;
  ScrollController control;
  CategoryLabel({Key? key, required this.control, required this.categories})
      : super(key: key);

  @override
  _CategoryLabelState createState() => _CategoryLabelState();
}

class _CategoryLabelState extends State<CategoryLabel> {
  int active = 1;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        controller: widget.control,
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              setState(() {
                active = index;
              });
            },
            child: Container(
              width: fullWidth / 2 - 5.0,
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: ThemeColors.lightGray.withOpacity(.7),
                        style: BorderStyle.solid,
                        width: 2.0)),
              ),
              child: Center(
                child: MontText(
                  text: widget.categories[index].toUpperCase(),
                  weight: active == index ? FontWeight.w500 : FontWeight.w400,
                  color: active == index
                      ? ThemeColors.blueBlack.withOpacity(0.6)
                      : ThemeColors.lightGray,
                  size: active == index ? M - 3 : M - 4.2,
                  letter: active == index ? 0 : -.1,
                ),
              ),
            ),
          );
        });
  }
}
