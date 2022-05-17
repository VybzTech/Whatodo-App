import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Dependencies extends StatefulWidget {
  const Dependencies({Key? key}) : super(key: key);

  @override
  State<Dependencies> createState() => _DependenciesState();
}

class _DependenciesState extends State<Dependencies> {
  List _dependencies = [
    {
      "tip": "Wifi",
      "ico": Icons.wifi_rounded,
      "sel": false,
      "col": Colors.greenAccent
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MontText(
                text: 'Is this Task Dependent on Anything',
                weight: FontWeight.w500,
                size: S,
                color: ThemeColors.blueBlack.withOpacity(.8),
                letter: 0.1,
              ),
            ),
            SansText(
              text: 'Select few',
              weight: FontWeight.w400,
              size: 10,
              color: ThemeColors.gray,
            )
          ],
        ),
        Row(
            children: List.generate(
                _dependencies.length,
                (index) => IconBtn(
                    tip: _dependencies[index]['tip'],
                    fnc: () {},
                    icon: _dependencies[index]['ico'],
                    sel: _dependencies[index]["sel"]))),
      ],
    );
  }
}
