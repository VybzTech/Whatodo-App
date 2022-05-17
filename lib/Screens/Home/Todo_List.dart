// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Components/SlidableWidget.dart';
// import 'package:whatodo/Components/Slidable.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Screens/Home/SeeAllBtn.dart';
import 'package:whatodo/Screens/Home/Todo_Preview.dart';
import 'package:whatodo/Styles.dart';

class TodoList extends StatelessWidget {
  final int num;
  final int index;
  TodoList({Key? key, required this.num, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void dismissSlidableItem(BuildContext _, int i, SlideActions actions) {
      switch (actions) {
        case SlideActions.archive:
          print('Task should Archive');
          break;
        case SlideActions.delete:
          print('Task should Archive');
          break;
      }
    }

    return WhiteBox(
        marg: EdgeInsets.symmetric(vertical: 0, horizontal: M),
        height: 190,
        radius: XS + 2,
        spread: 0.5,
        shadow: ThemeColors.lightGray.withOpacity(.3),
        width: double.maxFinite,
        pad: EdgeInsets.only(right: S, left: S, bottom: S, top: S),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, i) {
                    // return TodoPreview(no: i, pillNum: index);
                    return SlidableWidget(
                        onDismissed: (actions) =>
                            dismissSlidableItem(_, i, actions),
                        child: TodoPreview(no: i, pillNum: index));
                  },
                  separatorBuilder: (_, i) => Padding(
                        padding: const EdgeInsets.only(left: XL + XS),
                        child: Line(),
                      ),
                  itemCount: num),
            ),
            SizedBox(
              height: S,
            ),
            SeeAllBtn(index: index)
          ],
        ));
  }
}
