// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
// import 'package:whatodo/Components/onHover.dart';
import 'package:whatodo/Styles.dart';

class PillBtn extends StatefulWidget {
  final Color col1;
  final String text;
  final Color col2;
  final dynamic fnc;
  final EdgeInsets marg;
  final EdgeInsets pad;
  final double rad;
  final double textSiz;
  final double height;
  final bool bold;
  const PillBtn(
      {Key? key,
      this.height = 42,
      required this.col1,
      required this.fnc,
      required this.col2,
      required this.marg,
      required this.pad,
      required this.text,
      this.textSiz = S + 2.5,
      this.rad = XL * 2,
      this.bold = false})
      : super(key: key);

  @override
  State<PillBtn> createState() => _PillBtnState();
}

class _PillBtnState extends State<PillBtn> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
      cursor: MouseCursor.uncontrolled,
      onEnter: (event) => onEntered(true),
      onHover: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child:
          // Hovered(
          //     hovered: hovered,
          //     child:
          // child: Center(
          //   child: ElevatedButton(
          //       onHover: (val) => setState(() {
          //             hovered = val;
          //           }),
          //       onPressed: widget.fnc(),
          //       child: SansText(
          //         text: widget.text,
          //         size: hovered ? widget.textSiz + 0.5 : widget.textSiz,
          //         weight: FontWeight.w400,
          //         color: hovered ? Colors.white : Colors.white54,
          //       )),
          // )
          AnimatedContainer(
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 300),
              margin: widget.marg,
              height: widget.height,
              // 1749ae
              decoration: BoxDecoration(
                boxShadow: hovered
                    ? [
                        BoxShadow(
                          color: const Color(0x4415258a),
                          offset: Offset.zero,
                          blurRadius: XS,
                          spreadRadius: 1,
                        )
                      ]
                    : [],
                gradient: LinearGradient(
                    colors: [widget.col1, widget.col2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(widget.rad),
              ),
              child: InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    // setState(() => hovered = !hovered);
                    widget.fnc();
                    onEntered(true);
                    // var timer = Timer(Duration(milliseconds: 350),
                    //     () => setState(() => hovered = !hovered));
                  },
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                          child: SansText(
                        letter: 0.5,
                        text: widget.text,
                        size: hovered ? widget.textSiz + 0.5 : widget.textSiz,
                        weight: widget.bold ? FontWeight.w600 : FontWeight.w400,
                        color: hovered ? Colors.white : Colors.white54,
                      ))))));

  void onEntered(bool isHovered) {
    setState(() => hovered = isHovered);
    Future.delayed(
        Duration(milliseconds: 350), () => setState(() => hovered = false));
  }
}
