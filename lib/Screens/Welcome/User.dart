// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Welcome/AnimatedLogo.dart';
import 'package:whatodo/Screens/Welcome/UserControls.dart';
import 'package:whatodo/Styles.dart';

class User extends StatefulWidget {
  final bool day;
  const User({Key? key, required this.day}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.2,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      // AnimeLogo(day: widget.day, animate: animate),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MontText(
                                  text: "WHA'TOD",
                                  weight: FontWeight.w900,
                                  size: XL,
                                  letter: 0.25,
                                ),
                                ImageWrapper(
                                  imageHeight: 42,
                                  imageUrl: widget.day
                                      ? 'Images/icons8-todo-list-100.png'
                                      : 'Images/icons8-todo-list-100-2.png',
                                )
                              ]),
                          SizedBox(height: XS),
                          SansText(
                            text: 'Sign Up using Your Email and Password',
                            weight: FontWeight.w600,
                            letter: 0.075,
                            word: 0.35,
                            color: ThemeColors.whitishBlue.withOpacity(.8),
                            size: S + 2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                UserControls(anime: animate)
              ],
            )));
  }
}
