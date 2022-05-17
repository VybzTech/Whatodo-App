// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Styles.dart';

class SubHead extends StatefulWidget {
  const SubHead({Key? key}) : super(key: key);

  @override
  State<SubHead> createState() => _SubHeadState();
}

class _SubHeadState extends State<SubHead> {
  final space = SizedBox(
    width: XS + 5,
  );
  final box = Container(
    width: 17,
    height: 2.7,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: ThemeColors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        box,
        space,
        MontText(
            letter: 0.2,
            text: 'PRIORITIZE',
            weight: FontWeight.w600,
            size: S,
            color: ThemeColors.offWhite),
        space,
        box
      ],
    );
  }
}



// class _SubHeadState extends State<SubHead> with SingleTickerProviderStateMixin {
//CREATE A CONTROLLER & ANIMATION
  // late AnimationController _controller1;
  // late Animation<double> animation1;

  // List<String> subHeadings = ["PRIORITIZE", "ANALYZE", "REALIZE"];

//DEFINE THE FUNCTION
  // void translate(double pos) {
    // animation1 = Tween<double>(begin: 0, end: pos).animate(_controller1);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // _controller1 =
  //   //     AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  //   // translate(-15);
  // }

  // @override
  // void dispose() {
  //   _controller1.dispose();
  //   super.dispose();
  // }




/*
class _SubHeadState extends State<SubHead> with SingleTickerProviderStateMixin {
//CREATE A CONTROLLER & ANIMATION
  late AnimationController _controller1;
  late Animation<double> animation1;

  List<String> subHeadings = ["PRIORITIZE", "ANALYZE", "REALIZE"];

//DEFINE THE FUNCTION
  void translate(double pos) {
    animation1 = Tween<double>(begin: 0, end: pos).animate(_controller1);
    // _controller1.reverse(from: pos);
    // var AnimateSubHeading =
    // Timer(Duration(milliseconds: 100), () => {
    // });
    // AnimateSubHeading;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    translate(-15);
    _controller1.forward(from: 0);

    // _controller1.repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // AnimatedBuilder(animation: animation, builder: builder),
        // AnimatedBuilder(animation: animation, builder: builder),
        AnimatedSlide(
          offset: Offset(animation1.value, 0),
          duration: Duration(milliseconds: 1300),
          curve: Curves.easeInOut,
          child: WhiteBox(height: 3.0, width: 20.0, child: Container()),
        ),
        SizedBox(
          width: XS + 2,
        ),
        // AnimatedBuilder(animation: animation1,
        //  child:SansText(
        //   text: 'PRIORITIZE',
        //   weight: FontWeight.w400,
        //   size: S,
        // ) ,
        //  builder: (context,child)=>{
        //  };
        // //  )

        //  ),

        AnimatedCrossFade(
          firstChild: SansText(
            text: 'PRIORITIZE',
            weight: FontWeight.w400,
            size: S,
          ),
          secondChild: SansText(
            text: 'ANALYZE',
            weight: FontWeight.w400,
            size: S,
          ),
          crossFadeState: CrossFadeState.showFirst,
          duration: Duration(milliseconds: 1300),
        ),
        SizedBox(
          width: XS + 2,
        ),
        WhiteBox(height: 3.0, width: 20.0, child: Container()),
      ],
    );
  }
}
*/
