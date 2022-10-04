import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(controller: _controller, children: [
          Container(
            color: Colors.red,
            child: const Center(child: Text('page 1')),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text('page 2')),
          ),
          Container(
            color: Colors.indigo,
            child: const Center(child: Text('page 3')),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text('page 4')),
          ),
        ]),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: M, vertical: S),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  _controller.jumpToPage(2);
                },
                child: Text('SKIP')),
            //smooth_page_indicator: ^1.0.0+2
            // Center(child: SmoothPageIndicator(
            //onPageChanged
            // onDotClicked:(i)=>_controller.animateToPage(i, duration: Duration(milliseconds: 250),
            // curve: Curves.easeInOut)
            // controller:_controller,count:4,effect:WormEffect(
            // spacing:16,dotColor:Colors.black26,activeDotColor:Colors.teal)),)
            TextButton(
                onPressed: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut);
                  // _controller.nextPage(
                  //     duration: Duration(milliseconds: 250),
                  //     curve: Curves.easeInOut);
                },
                child: Text('NEXT'))
          ],
        ),
      ),
    );
  }
}
