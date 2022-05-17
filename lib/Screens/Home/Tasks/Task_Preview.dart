// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Header.dart';
import 'package:whatodo/Styles.dart';
import 'Task_Details.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key}) : super(key: key);

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  bool col = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Header(
              height: 135.0,
              begin: ThemeColors.blueOriginal,
              end: ThemeColors.blue,
              dated: false),
          Positioned.fill(top: 112.0, child: TaskDetails()),
          //CLOSE BUTTON
          Positioned(
              top: 117,
              right: XS,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      col = !col;
                    });
                    BlocProvider.of<AppCubits>(context).goHome();
                  },
                  icon: Icon(Icons.cancel),
                  iconSize: M + 1,
                  // constraints: BoxConstraints(maxHeight: M, maxWidth: M),
                  color: col
                      ? ThemeColors.blueBlack.withOpacity(.5)
                      : ThemeColors.gray.withOpacity(.5))),
          //DONE BUTTON
          Positioned(
            bottom: XL * 2,
            right: M,
            child: CompBtn(
                child: Icon(
                  Icons.done_rounded,
                  size: M + 2,
                  color: ThemeColors.white,
                ),
                size: L * 1.85,
                fnc: () {},
                color1: ThemeColors.blueOriginal,
                color2: ThemeColors.blueDark),
          )
        ],
      ),
    );
  }
}
