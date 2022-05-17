// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, unnecessary_null_comparison, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

//DEFAULTS
const XL = 37.0;
const L = 25.0;
const M = 20.0;
const S = 12.0;
const XS = 7.0;

//COLORS
class ThemeColors {
  static final Color blueOriginal = Color(0xee3773e1); //Original
  static final Color blue = Color(0xff3950f5);
  static final Color blueDark = Color(0xff1749ae);

//  static Color get blueDark => Color(0xff1749ae);
  // static final Color white = Color(0xfff5f5f5);
  static final Color white = Color(0xfff5f5fA);
  static final Color offWhite = Color(0xffe9eaec);
  static final Color lightGray = Color(0xffbbbbbb);
  static final Color gray = Color(0xff999999);
  static final Color whitishBlue = Color(0xff8cc5fc);
  static final Color blueBlack = Color(0xff080c14);
}

// WELCOME PAGE
const montIntro = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w900,
    letterSpacing: 0.3,
    fontSize: XL,
    color: Colors.white);
const footer = TextStyle(
  fontFamily: 'San',
  fontWeight: FontWeight.w400,
  fontSize: S + 2.0,
  letterSpacing: 0.6,
  color: Colors.white70,
);

//MONTSERRAT TEXTING
class MontText extends StatelessWidget {
  double size;
  Color color;
  final String text;
  double letter;
  double word;
  final FontWeight weight;

  MontText(
      {Key? key,
      this.size = L,
      this.color = Colors.white,
      required this.text,
      this.letter = 0.0,
      this.word = 0.0,
      required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        wordSpacing: word,
        letterSpacing: letter,
        fontFamily: 'Montserrat',
        fontWeight: weight,
      ),
    );
  }
}

//SOURCE SANS TEXTING
class SansText extends StatelessWidget {
  double size;
  Color color;
  final String text;
  double letter;
  double word;
  final FontWeight weight;

  SansText({
    Key? key,
    this.size = M,
    this.color = Colors.white,
    required this.text,
    this.letter = 0.0,
    this.word = 0.0,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'San',
        letterSpacing: letter,
        fontWeight: weight,
        wordSpacing: word,
      ),
    );
  }
}

//IMAGE WRAPPING
class ImageWrapper extends StatelessWidget {
  String imageUrl;
  final double imageHeight;
  bool bordered;

  ImageWrapper(
      {Key? key,
      this.bordered = false,
      this.imageUrl = '',
      required this.imageHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: bordered ? const EdgeInsets.all(2.5) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: bordered
              ? Border.all(
                  style: BorderStyle.solid,
                  width: 1.1,
                  color: ThemeColors.whitishBlue.withOpacity(.5))
              : null,
        ),
        constraints:
            BoxConstraints.expand(height: imageHeight, width: imageHeight),
        child: imageUrl == ''
            ? Icon(
                Icons.person,
                size: 33.0,
                color: ThemeColors.whitishBlue.withOpacity(0.7),
              )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imageUrl)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ));
  }
}

//DATE PILL
class DatePill extends StatelessWidget {
  final String day;
  final int date;
  final ScrollController control;
  final double pos;
  DatePill(
      {Key? key,
      required this.date,
      required this.day,
      required this.control,
      required this.pos})
      : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(right: 15.0, left: 3.0, top: 4.0, bottom: 6.0),
      padding: const EdgeInsets.only(left: 11, right: 11, top: 7.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              ThemeColors.blueDark.withOpacity(0.35),
              ThemeColors.blueDark.withOpacity(0.8)
            ],
          ),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 0.01,
                blurRadius: 5.0,
                offset: Offset(0.25, 1.5),
                color: Color(0x77070707)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SansText(
            text: day,
            size: S,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 2.5,
          ),
          MontText(
            text: date.toString(),
            size: L - 2.5,
            weight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

//HALF BUTTON
class HalfNav extends StatelessWidget {
  double wit;
  bool left;
  double divisor;
  ScrollController control;
  HalfNav(
      {Key? key,
      required this.wit,
      required this.left,
      required this.divisor,
      required this.control})
      : super(key: key);

  @override
  Widget build(BuildContext context) => left && divisor != 0
      ? Container(
          width: wit,
          height: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: ThemeColors.blueBlack.withOpacity(0.15)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  ThemeColors.white,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 0.01,
                  blurRadius: 5.0,
                  offset: Offset(0.25, 1.5),
                  color: Color(0x44111111),
                ),
              ]),
          child: IconButton(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 15.0),
            iconSize: M - 2.0,
            color: ThemeColors.lightGray,
            focusColor: Colors.white,
            hoverColor: ThemeColors.offWhite,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              control.position.animateTo(-divisor,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut);
            },
          ),
        )
      : Container(
          width: 30.0,
          height: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)),
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: ThemeColors.blueBlack.withOpacity(0.15)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  ThemeColors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.01,
                  blurRadius: 5.0,
                  offset: Offset(0.25, 1.5),
                  color: ThemeColors.lightGray,
                ),
              ]),
          child: IconButton(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 15.0),
            iconSize: M - 2.0,
            color: ThemeColors.lightGray,
            focusColor: Colors.white,
            hoverColor: ThemeColors.offWhite,
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              control.position.animateTo(divisor,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut);
            },
          ),
        );
}

//LINE WIDG
class Line extends StatelessWidget {
  final double height;
  const Line({
    Key? key,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      color: ThemeColors.lightGray.withOpacity(.3),
    );
  }
}

//PILL BUTTON
class PillBtn extends StatelessWidget {
  final Widget child;
  final Color col1;
  final Color col2;
  final dynamic fnc;
  final EdgeInsets marg;
  final EdgeInsets pad;
  final double rad;
  const PillBtn({
    Key? key,
    required this.col1,
    required this.fnc,
    required this.col2,
    required this.marg,
    required this.pad,
    required this.child,
    this.rad = XL * 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: pad,
        margin: marg,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [col1, col2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(rad),
        ),
        child: InkWell(
          onTap: fnc,
          child: Center(child: child),
        ));
  }
}

//SQUARE BUTTON
class SquareBtn extends StatelessWidget {
  final Color col;
  final Widget child;
  final dynamic fnc;
  final double size;
  const SquareBtn(
      {Key? key,
      required this.col,
      required this.fnc,
      required this.child,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(5.5),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 0.1)
          ]),
      width: size,
      height: size,
      // padding: EdgeInsets.symmetric(vertical: XS,horizontal: XS),
      child: InkWell(onTap: fnc, child: Center(child: child)),
    );
  }
}

//RESPONSIVE  BUTTON
class ResBtn extends StatelessWidget {
  // final double high;
  final Color color1;
  final Color color2;
  final Widget child;
  final dynamic fnc;
  final EdgeInsets pad;
  final EdgeInsets marg;
  ResBtn({
    Key? key,
    required this.child,
    required this.fnc,
    required this.color1,
    required this.color2,
    this.pad = EdgeInsets.zero,
    this.marg = EdgeInsets.zero,
    // required this.high
  }) : super(key: key);
  bool col = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        margin: marg,
        padding: pad,
        // height: high,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.center,
            // begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: color1.withOpacity(.35),
              spreadRadius: 0.05,
              blurRadius: 4,
            )
          ],
        ),
        child: InkWell(onTap: fnc, child: Center(child: child)));
  }
}

//COMPLETE  BUTTON
class CompBtn extends StatelessWidget {
  final double size;
  final Color color1;
  final Color color2;
  final Widget child;
  final dynamic fnc;
  final EdgeInsets pad;
  final EdgeInsets marg;
  CompBtn({
    Key? key,
    required this.child,
    required this.size,
    required this.fnc,
    required this.color1,
    required this.color2,
    this.pad = EdgeInsets.zero,
    this.marg = EdgeInsets.zero,
  }) : super(key: key);
  bool col = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        margin: marg,
        padding: pad,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(XL * 5),
          boxShadow: [
            BoxShadow(
              color: color1.withOpacity(.35),
              spreadRadius: 0.05,
              blurRadius: 4,
            )
          ],
        ),
        child: InkWell(onTap: fnc, child: Center(child: child)));
  }
}

//ICON BUTTON
class IconBtn extends StatelessWidget {
  final String tip;
  final dynamic fnc;
  final IconData icon;
  final bool sel;
  final double icoSize;

  const IconBtn(
      {Key? key,
      required this.tip,
      required this.fnc,
      required this.icon,
      required this.sel,
      this.icoSize = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: icoSize,
      padding: EdgeInsets.zero,
      splashRadius: M,
      color: ThemeColors.gray,
      focusColor: Colors.black,
      hoverColor: Colors.black,
      tooltip: tip,
      onPressed: fnc,
      icon: Icon(
        icon,
        color: sel ? ThemeColors.blueBlack : ThemeColors.gray.withOpacity(.8),
      ),
    );
  }
}
