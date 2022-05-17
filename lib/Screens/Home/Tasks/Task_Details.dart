// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';
import 'package:whatodo/Screens/Home/FIlter.dart';
import 'package:whatodo/Screens/Home/Tasks/DueDate.dart';
import 'package:whatodo/Screens/Home/Tasks/Reminder.dart';
import 'package:whatodo/Screens/Home/Tasks/SubTasks.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskDep.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskIntro.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskNotes.dart';
import 'package:whatodo/Screens/Home/Tasks/TaskPriority.dart';
import 'package:whatodo/Styles.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        String day;
        String task = 'Complete Morning Routine';
        // int individualIndex = state.props[0].hashCode;
        int pillIndex = state.props[1].hashCode;
        day = filters[pillIndex]["filterName"];
        String notes =
            'This is some Additional notes to aid my Design of the Whatodo App';
        return Container(
            padding: EdgeInsets.symmetric(vertical: XS, horizontal: S + 2),
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(M + 4),
                    topRight: Radius.circular(M + 4))),
            child: Column(
              children: [
                SizedBox(
                  height: S,
                ),
                TaskIntro(
                  day: day,
                  task: task,
                ),
                Container(
                  padding: EdgeInsets.only(top: 0, left: S, right: S),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskPriority(),
                      Line(),
                      DueDate(),
                      Line(),
                      Reminder(),
                      Line(),
                      TaskDep(),
                      Line(),
                      TaskNotes(note: notes),
                      SubTasks(num: 3),
                      PillBtn(
                          pad: EdgeInsets.symmetric(vertical: S),
                          marg: EdgeInsets.only(
                              left: XL, right: XL, top: L * 2.2),
                          col1: ThemeColors.blueOriginal.withOpacity(.8),
                          col2: ThemeColors.blueOriginal,
                          fnc: () {},
                          child: SansText(
                            text: 'Edit Task',
                            weight: FontWeight.w400,
                            color: Colors.white,
                            size: S + 3,
                          )),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
