// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Components/NamedNav.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Addition/Attachments.dart';
import 'package:whatodo/Screens/Addition/Details.dart';
import 'package:whatodo/Screens/Addition/AddReminder.dart';
import 'package:whatodo/Screens/Addition/SubTask.dart';
import 'package:whatodo/Styles.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  late String taskName;
  late String notes;

  List<Widget> Fields = [
    Details(
      taskName: '',
      notes: '',
    ),
    Attachment(),
    subTask(),
    AddReminder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: ThemeColors.white,
        body: Stack(children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: XL, bottom: 5),
                  child: Nav(
                      version: 0,
                      nav: 'Todos',
                      siz: S,
                      fnc: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      }),
                ),
                Expanded(
                    child: Fader(
                        child: ListView.separated(
                            padding:
                                EdgeInsets.only(left: M, right: M, top: XS),
                            itemBuilder: (_, i) => Fields[i],
                            separatorBuilder: (_, i) => Line(),
                            itemCount: Fields.length))),
                PillBtn(
                    col1: ThemeColors.blueBlack.withOpacity(.5),
                    col2: ThemeColors.blueBlack.withOpacity(.75),
                    fnc: () {
                      print(formKey.currentState!);
                      // print(taskName);
                    },
                    marg:
                        EdgeInsets.only(bottom: M, left: XL * 2, right: XL * 2),
                    pad: EdgeInsets.symmetric(vertical: S),
                    child: SansText(
                      text: 'Review & Save',
                      size: S + 4,
                      weight: FontWeight.w500,
                    ))
              ],
            ),
          )
        ]));
  }
}
