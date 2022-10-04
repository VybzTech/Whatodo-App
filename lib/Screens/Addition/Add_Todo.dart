// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Boxes.dart';
import 'package:whatodo/Components/CustomToast.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Components/NamedNav.dart';
import 'package:whatodo/Components/PillButton.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Addition/Details.dart';
import 'package:whatodo/Screens/Addition/SubTask.dart';
import 'package:whatodo/Styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo extends StatefulWidget {
  AddTodo({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();
  final taskNameController = TextEditingController();
  final folderController = TextEditingController();
  final notesController = TextEditingController();
  final priorityController = TextEditingController();
  final dueDateController = TextEditingController();
  final radioController = TextEditingController();
  final subTasks = <String>[];
  final dep = <int>[];
  DateTime dueDate = DateTime.now();
  final toast = FToast();
  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    void clearSubs() => subTasks.clear();
    void clearDeps() {
      dep.clear();
      setState(() {});
    }

    List<Widget> Fields = [
      Details(
          titleControl: taskNameController,
          notesControl: notesController,
          priorityControl: priorityController,
          dateControl: dueDateController,
          radioControl: radioController,
          folderControl: folderController,
          dueDate: dueDate),
      subTask(list: subTasks, dep: dep, callback: clearSubs),
    ];

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
                        padding:
                            const EdgeInsets.only(top: XL - 3, bottom: XS + 3),
                        child: Nav(
                            version: 0,
                            nav: 'Todos',
                            siz: S + 1,
                            color: ThemeColors.blueOriginal,
                            fnc: () {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: 'Pull to Refresh',
                                  // backgroundColor: Colors.blue[700],
                                  backgroundColor:
                                      ThemeColors.blue.withOpacity(.96),
                                  textColor: ThemeColors.white,
                                  gravity: ToastGravity.BOTTOM);
                            })),
                    Expanded(
                        child: Fader(
                            child: ListView.separated(
                                separatorBuilder: (_, i) => Line(),
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: M, right: M, top: XS, bottom: L * 2),
                                itemBuilder: (_, i) => Fields[i],
                                itemCount: Fields.length))),
                    PillBtn(
                      col1: ThemeColors.blueBlack.withOpacity(.5),
                      col2: ThemeColors.blueBlack.withOpacity(.7),
                      fnc: () {
                        if (taskNameController.text.trim() == '') {
                          Fluttertoast.showToast(
                              msg: 'Try Adding a Todo Name',
                              fontSize: S,
                              gravity: ToastGravity.TOP,
                              backgroundColor: prioColors.red1.withOpacity(.65),
                              textColor: ThemeColors.white);
                          return;
                        }

                        // context.read<AppCubits>().addTask(
                        //     taskNameController.text.trim(),
                        //     notesController.text.trim(),
                        //     priorityController.text.trim(),
                        //     dueDateController.text.trim(),
                        //     radioController.text.trim(),
                        //     folderController.text.trim(),
                        //     subTasks,
                        //     dep);

                        final newTodo = Todo(
                          id: IdClass().generate(),
                          createdTime: DateTime.now(),
                          taskName: taskNameController.text.trim(),
                          folder: folderController.text.trim(),
                          priority: priorityController.text.trim(),
                          dueDate: dueDateController.text.trim(),
                          notes: notesController.text.trim(),
                          recurring: radioController.text.trim() == ''
                              ? 'periodic'
                              : radioController.text.trim(),
                          subtasks: subTasks,
                          dep: dep,
                          archived: false,
                          deleted: false,
                          isDone: false,
                        );
                        context.read<AppCubits>().addTodo(newTodo);

                        // final box = Boxes.getTodos();
                        // box.add(newTodo);
                        //DISPLAY TOAST MESSAGE
                        toast.showToast(
                            child: buildToast(prioColors.green2, 'Saved Todo',
                                MdiIcons.checkAll, Icons.done_all),
                            gravity: ToastGravity.TOP);

                        //CLEAR FIELDS AFTER FEW SECONDS
                        Timer(Duration(milliseconds: 250), () {
                          taskNameController.clear();
                          notesController.clear();
                          dueDateController.clear();
                          radioController.clear();
                          folderController.clear();
                          setState(() => dueDate = DateTime.now());
                        });
                      },
                      marg: EdgeInsets.only(bottom: M, left: XL, right: XL),
                      pad: EdgeInsets.symmetric(vertical: XS),
                      text: 'Save',
                    )
                  ]))
        ]));
  }
}
