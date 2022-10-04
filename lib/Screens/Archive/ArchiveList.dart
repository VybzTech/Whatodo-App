// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/SlidableWidget.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class ArchiveList extends StatelessWidget {
  const ArchiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _values = [
      {"valName": "Redesign Sammie Art", "valNo": 7, "valDate": '09/03/21'},
      {"valName": "Build Todo App", "valNo": 0, "valDate": '09/03/21'},
      {"valName": "Redesign Portfolio", "valNo": 2, "valDate": '21/13/21'},
    ];

    void dismissSlidableItem(BuildContext _, int i, SlideActions actions) {
      switch (actions) {
        case SlideActions.archive:
          // print('Task should Archive');
          break;
        case SlideActions.delete:
          // print('Task should Archive');
          break;
      }
    }

    return Expanded(
        child: WhiteBox(
            marg: const EdgeInsets.symmetric(vertical: M, horizontal: L - 3),
            height: XL,
            width: double.maxFinite,
            shadow: ThemeColors.lightGray.withOpacity(0.2),
            radius: XS + 3,
            spread: 0.25,
            blur: XS,
            child: ListView.builder(
                itemCount: _values.length,
                itemBuilder: (_, index) {
                  return SlidableWidget(
                    child: ArchivePill(archive: _values[index], index: index),
                    onDismissed: (actions) =>
                        dismissSlidableItem(_, index, actions),
                  );
                })));
  }
}

class ArchivePill extends StatelessWidget {
  final dynamic archive;
  final int index;
  const ArchivePill({Key? key, required this.archive, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.fromLTRB(M, index == 0 ? 0 : S + 3, M, S),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: ThemeColors.lightGray.withOpacity(.3), width: 1.05))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.folder_open_rounded,
                      color: ThemeColors.blueOriginal),
                  const SizedBox(width: S),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MontText(
                            text: archive['valName'],
                            weight: FontWeight.w700,
                            size: M - 2,
                            color: ThemeColors.blueBlack),
                        const SizedBox(height: XS / 3),
                        SansText(
                            text: "${archive["valNo"].toString()} Sub Task",
                            weight: FontWeight.w400,
                            size: XS,
                            color: ThemeColors.gray)
                      ])
                ]),
            SansText(
                text: archive["valDate"],
                size: S - 2,
                weight: FontWeight.w300,
                color: ThemeColors.blueOriginal)
          ]));
}
