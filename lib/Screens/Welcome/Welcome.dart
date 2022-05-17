// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatodo/Components/Footer.dart';
import 'package:whatodo/Components/MyAddButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';
import 'package:whatodo/Screens/Welcome/SubHeading.dart';
import 'package:whatodo/Styles.dart';

class Welcome extends StatelessWidget {
  final bool day;
  Welcome({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.3,
                onError: (exception, stackTrace) => print(stackTrace),
                image: AssetImage('Images/WHATODO-HOME-DESIGN.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.45, 1],
                colors: [ThemeColors.blue, ThemeColors.blueDark],
              ),
              backgroundBlendMode: BlendMode.multiply),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWrapper(
                        imageUrl: day
                            ? 'Images/icons8-todo-list-100.png'
                            : 'Images/icons8-todo-list-100-2.png',
                        imageHeight: XL * 2.25),
                    SizedBox(
                      height: XS,
                    ),
                    MontText(
                      text: "WHA'TODO",
                      weight: FontWeight.w900,
                      letter: -.2,
                      size: XL,
                    ),
                    SizedBox(
                      height: XS - 4,
                    ),
                    SubHead(),
                  ]),
              Footer(
                Light: true,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: XL - 3, right: XS - 3),
          child: MyAddButton(
            fnc: () {
              context.read<AppCubits>().faqPage();
            },
            symbol: '?',
            textSize: M + 1.0,
            wei: FontWeight.w500,
          ),
        ),
      );
    });
  }
}
