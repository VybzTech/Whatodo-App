// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class Dates extends StatefulWidget {
  Dates({Key? key}) : super(key: key);

  @override
  _DatesState createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  String currentMonth = '';
  double scrollPosition = 0;
  List<DateTime> allDates = [];
  DateTime today = DateTime.now();
  int thisYear = DateTime.now().year;
  late ScrollController _scrollController;
  final Tween<Offset> _offset = Tween(begin: Offset(0, 2), end: Offset(0, 0));
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  int getDaysInMonth(int year, int start, int end) => DateTimeRange(
          start: DateTime(year, start, 0), end: DateTime(year, end, 0))
      .duration
      .inDays;

  DateTime buildDateTimes(int index) {
    int monthNo = index + 1;
    int noOfDaysInMonth = getDaysInMonth(thisYear, monthNo, monthNo + 1);
    for (var i = 1; i <= noOfDaysInMonth; i++) {
      DateTime loopDays = DateTime(thisYear, monthNo, i);
      allDates.add(loopDays);
    }
    return today;
  }

  @override
  void initState() {
    super.initState();
    // SET INITIAL MONTH
    currentMonth = DateFormat('LLLL').format(today).toUpperCase();
    List<DateTime> monthly =
        List.generate(12, (index) => buildDateTimes(index));

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //SET SCROLL POSITION
      setState(() => scrollPosition = _scrollController.position.pixels);
      checkScroll();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        //SCROLL TO MIDDLE AFTER WIDGET LOADS
        scrollToMiddle());
  }

  checkScroll() {
    // int supposedIndex = scrollPosition ~/ 53.085;
    int supposedIndex = scrollPosition ~/ 48.85;
    setState(() => currentMonth =
        DateFormat('LLLL').format(allDates[supposedIndex + 4]).toUpperCase());
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        Container(
            width: double.maxFinite,
            height: 83,
            child: AnimatedList(
                key: _listKey,
                initialItemCount: allDates.length, //365
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, i, a) {
                  DateTime day = allDates[i];
                  bool pill = day.day == today.day && day.month == today.month;
                  return SlideTransition(
                      position: a.drive(_offset),
                      child: pill
                          ? DatePill(
                              date: day.day,
                              day:
                                  DateFormat('EEE').format(today).toUpperCase(),
                              control: _scrollController)
                          : NormalPill(
                              date: day.day,
                              day: DateFormat('EEE').format(day).toUpperCase(),
                              control: _scrollController));
                })),
        SizedBox(height: XS / 2),
        InkWell(
            onTap: scrollToMiddle,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(useIcon(MdiIcons.calendarMonth, Icons.calendar_month),
                      size: S + 3),
                  SizedBox(width: XS / 2),
                  MontText(
                    text: currentMonth,
                    size: S - 0.25,
                    letter: -0.1,
                    weight: FontWeight.w400,
                  )
                ]))
      ]);

  scrollToMiddle() {
    int todayIndex = allDates.indexWhere((datetimes) =>
            datetimes.day == today.day && datetimes.month == today.month) +
        1;
    double halfWidth = MediaQuery.of(context).size.width / 2;
    //Increase to Move DatePill Left   53.08
    double pos = (todayIndex * 48.85) - halfWidth;
    _scrollController.position.animateTo(pos,
        duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  }
}
