// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';
import 'package:flutter/material.dart';
import 'package:whatodo/Components/WhiteBox.dart';

class DueDate extends StatefulWidget {
  DateTime dueDate;
  final double siz;
  TextEditingController control;
  DueDate(
      {Key? key,
      required this.control,
      required this.siz,
      required this.dueDate})
      : super(key: key);

  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
  String dueDays = 'No Due Date';

  DateTime initialDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    DateTime firstDate = DateTime(DateTime.now().year - 100);
    DateTime lastDate = DateTime(DateTime.now().year + 100);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (pickedDate != null && pickedDate != initialDate) {
      print(DateFormat('dd/MM/yyyy').format(pickedDate));
      setState(() {
        widget.dueDate = pickedDate;
        widget.control.text = DateFormat('ddMMyyyy').format(pickedDate);
      });
      int daysDiff = widget.dueDate.difference(DateTime.now()).inDays + 1;
      setState(
          () => dueDays = '$daysDiff day${plural(daysDiff)} till due date');
    }
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MontText(
                  text: 'Due Date',
                  weight: FontWeight.w600,
                  size: M - 2.75,
                  letter: -0.35,
                  color: widget.control.text.isNotEmpty
                      ? ThemeColors.blueBlack
                      : ThemeColors.blueBlack.withOpacity(.65)),
              InkWell(
                onTap: () => selectDate(context),
                child: WhiteBox(
                    pad: const EdgeInsets.only(left: L / 2),
                    radius: 5,
                    spread: 1.5,
                    blur: 7,
                    shadow: ThemeColors.offWhite,
                    height: 37,
                    width: widget.siz,
                    child: Row(children: [
                      SansText(
                          text: DateFormat('dd LLL, yyyy.')
                              .format(widget.dueDate),
                          weight: FontWeight.w400,
                          // color: widget.dueDate.day == DateTime.now().day &&
                          //         widget.dueDate.month == DateTime.now().month
                          color: widget.control.text.isNotEmpty
                              ? ThemeColors.blueBlack.withOpacity(.8)
                              : ThemeColors.blueBlack.withOpacity(0.45),
                          size: S + 4,
                          letter: 0.25)
                    ])),
              )
            ]),
        SizedBox(height: XS),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.control.text.isNotEmpty
                ? Icon(
                    useIcon(
                        MdiIcons.calendarClock, Icons.calendar_today_rounded),
                    size: S - 2,
                    color: ThemeColors.lightGray,
                  )
                : SizedBox(),
            SizedBox(
              width: 2,
            ),
            MontText(
                text: dueDays,
                weight: FontWeight.w500,
                color: widget.control.text.isNotEmpty
                    ? ThemeColors.lightGray
                    : ThemeColors.lightGray.withOpacity(.6),
                size: S - 1.7),
          ],
        )
      ]);
}
