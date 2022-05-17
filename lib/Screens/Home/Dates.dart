// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatodo/Styles.dart';

class Dates extends StatefulWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  _DatesState createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  DateTime today = DateTime.now();
  late ScrollController _scrollController;

//DEFINE VARIABLES
  String currentMonth = '';
  int daysInMonth = 0;
  dynamic monthly = [];
  double pos = 0;
  @override
  void initState() {
    super.initState();
    daysInMonth = DateTime(today.year, today.month + 1, 0)
        .day; //SET MONTH'S NO FROM TODAY'S MONTH
    currentMonth =
        DateFormat('LLLL').format(today).toUpperCase(); //SET TODAY'S MONTH

    for (DateTime indexDay = DateTime(today.year, today.month, 1);
        indexDay.month == today.month;
        indexDay = indexDay.add(Duration(days: 1))) {
      //LOOP EVERY DAY TO LIST FOR TODAY'S MONTH
      monthly.add(indexDay);
    }
    _scrollController = ScrollController();
    _scrollController.addListener(() {});

    // scrollToMiddle();
  }

  @override
  Widget build(BuildContext context) {
    scrollToMiddle() {
      _scrollController.hasClients
          ? _scrollController.position.animateTo(
              ((_scrollController.position.maxScrollExtent / daysInMonth) *
                      today.day) +
                  (3.5 * today.day),
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceIn)
          : null;
    }

    return Column(children: [
      Container(
        width: double.maxFinite,
        height: 85.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daysInMonth,
            controller: _scrollController,
            itemBuilder: (_, index) {
              //PARTICULAR DAY IN MONTH
              final day = monthly[index];
              if (day.day == today.day) {
                return DatePill(
                    control: _scrollController,
                    pos: pos,
                    date: today.day,
                    day: DateFormat('EEE').format(today).toUpperCase());
              }
              return Container(
                margin: const EdgeInsets.only(right: S + 1),
                padding: const EdgeInsets.symmetric(
                    vertical: XS, horizontal: XS + 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SansText(
                      text: DateFormat('EEE').format(day).toUpperCase(),
                      size: S,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    MontText(
                      text: day.day.toString(),
                      size: M,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              );
            }),
      ),
      SizedBox(
        height: XS - 3,
      ),
      InkWell(
        onTap: () {
          _scrollController.position.animateTo(
              ((_scrollController.position.maxScrollExtent / daysInMonth) + 5) *
                  today.day,
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceIn);
        },
        child: MontText(
          text: currentMonth,
          size: S + .5,
          weight: FontWeight.w400,
        ),
      )
    ]);
  }
}





//SORITNG DATES
/**
 * List <String> dates = ["2021-12-23","..."];
 * 
 * dates.sort((a,b){
 * return
 * DateTime.parse(a).compareTo(DateTime.parse(b));
 * })
 * 
 * Column with children
 * dates.map((dateOne){
 * Text(dateOne);
 * })
 * 
 * 
 */
