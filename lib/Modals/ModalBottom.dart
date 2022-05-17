// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class builtBtn extends StatelessWidget {
  final String text;
  final dynamic fnc;
  const builtBtn({Key? key, required this.text, required this.fnc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: L, vertical: M)),
      child: Text(text),
      onPressed: fnc,
    );
  }
}

class ModalBottom extends StatelessWidget {
  const ModalBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          builtBtn(
              text: 'Simple Sheet',
              fnc: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  // elevation: M,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  isScrollControlled: true,
                  // isDismissible :false,
                  // enableDrag: false,
                  context: context,
                  builder: (context) => buildSheet(context))),
        ],
      )),
    );
  }
}

Widget makeDissimible({context, required Widget child}) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );
const test = Text(
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil deserunt fuga sint consequuntur repellendus excepturi ea. Corrupti ratione quis, aperiam ex nihil delectus dicta non tenetur eveniet, ipsa, eum fugiat doloribus. Dolores, dolor accusamus deleniti, ratione earum exercitationem fuga tenetur tempore autem repellendus minus odit nulla animi cumque delectus reprehenderit!');
const space = SizedBox(height: L);
Widget buildSheet(_) => makeDissimible(
      context: _,
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.925,
        builder: (_, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: M, horizontal: L),
          child: ListView(
            controller: scrollController,
            // child: Column(
            // mainAxisSize: MainAxisSize.min, //EXPERIMENTAL
            children: [
              test,
              space,
              test,
              space,
              test,
              space,
              test,
              space,
              test,
              space,
              test,
              Center(
                child: ElevatedButton(
                    onPressed: () => Navigator.of(_).pop(),
                    child: SansText(
                      text: 'Close',
                      weight: FontWeight.w500,
                      color: ThemeColors.blueBlack,
                      size: S,
                    )),
              )
            ],
          ),
        ),
      ),
    );
