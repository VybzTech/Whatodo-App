// ignore_for_file: prefer_const_constructors, file_names,todo, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class AnimeLogo extends StatefulWidget {
  final bool day;
  final bool animate;

  AnimeLogo({Key? key, required this.day, required this.animate})
      : super(key: key);

  @override
  State<AnimeLogo> createState() => _AnimeLogoState();
}

class _AnimeLogoState extends State<AnimeLogo>
    with SingleTickerProviderStateMixin {
  late Animation anime;
  late AnimationController _control;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _control =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    anime = Tween<double>(begin: 0.0, end: 1.0).animate(_control);
    var timer = Timer.periodic(Duration(seconds: 2), (Timer time) {
      widget.animate ? _control.animateTo(1) : _control.animateTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
        scale: anime.value,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        child: Positioned(
          right: S,
          child: ImageWrapper(
            imageHeight: 150,
            imageUrl: widget.day
                ? 'Images/icons8-todo-list-100.png'
                : 'Images/icons8-todo-list-100-2.png',
          ),
        ));
  }
}
