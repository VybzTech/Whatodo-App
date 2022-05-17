// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class TodoPreview extends StatefulWidget {
  int no;
  int pillNum;
  TodoPreview({Key? key, required this.no, required this.pillNum})
      : super(key: key);

  @override
  _TodoPreviewState createState() => _TodoPreviewState();
}

class _TodoPreviewState extends State<TodoPreview> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: InkWell(
        onTap: () {
          setState(() {
            hovered = true;
          });
          BlocProvider.of<AppCubits>(context)
              .getDetails(widget.no, widget.pillNum);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: XS, top: S, bottom: S, right: S),
                  child: Icon(
                    Icons.folder_open_rounded,
                    size: L + 1,
                    color: ThemeColors.blue,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MontText(
                      text: 'Good Morning',
                      weight: FontWeight.w700,
                      color: ThemeColors.blueBlack,
                      size: S + 4,
                      letter: 0.2,
                    ),
                    SizedBox(height: 1.5),
                    SansText(
                      text: '3 Sub Task',
                      size: S - 1,
                      letter: .4,
                      weight: FontWeight.w600,
                      color: ThemeColors.gray,
                    ),
                  ],
                )
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  hovered = true;
                });
                //Goto Todo Page with Current Info
                BlocProvider.of<AppCubits>(context)
                    .getDetails(widget.no, widget.pillNum);
              },
              constraints: BoxConstraints(maxHeight: M, maxWidth: M + XL),
              iconSize: L - 1.5,
              padding: EdgeInsets.zero,
              color: hovered
                  ? ThemeColors.blueBlack.withOpacity(.8)
                  : ThemeColors.lightGray.withOpacity(.8),
              icon: Icon(Icons.keyboard_arrow_right_rounded),
            )
          ],
        ),
      ),
    );
  }
}
