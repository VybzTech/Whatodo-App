import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class BinList extends StatelessWidget {
  const BinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List Values = [
      {"valName": "Redesign Sammie Art", "valNo": 7, "valDate": '09/03/21'},
      {"valName": "Build Todo App", "valNo": 0, "valDate": '09/03/21'},
      {"valName": "Redesign Portfolio", "valNo": 2, "valDate": '21/13/21'},
    ];
    return Expanded(
        child: WhiteBox(
            marg: const EdgeInsets.symmetric(vertical: M, horizontal: L),
            height: XL,
            shadow: ThemeColors.lightGray.withOpacity(.5),
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: Values.length,
              itemBuilder: (context, index) {
                var archive = Values[index];
                return Container(
                    padding:
                        EdgeInsets.fromLTRB(M, index == 0 ? 0 : S + 3, M, S),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color: ThemeColors.lightGray.withOpacity(.3),
                                width: 1.05))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MontText(
                              text: archive['valName'],
                              weight: FontWeight.w700,
                              size: M - 2,
                              color: ThemeColors.blueBlack,
                            ),
                            const SizedBox(
                              height: XS / 3,
                            ),
                            SansText(
                              text: "${archive["valNo"].toString()} Sub Task",
                              weight: FontWeight.w400,
                              size: XS,
                              color: ThemeColors.gray,
                            )
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_left_rounded),
                      ],
                    ));
              },
            )));
  }
}
