// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/CustomToast.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Components/NamedNav.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Components/PillButton.dart';
import 'package:whatodo/Screens/Addition/Folder.dart';
import 'package:whatodo/Components/Priority.dart';
import 'package:whatodo/Screens/Addition/SubTask.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Tasks/EditSubTask.dart';
// import 'package:whatodo/Screens/Addition/Details.dart';
// import 'package:whatodo/Screens/Addition/SubTask.dart';
import 'package:whatodo/Styles.dart';

import 'package:whatodo/Screens/Addition/DueDate.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;
  EditTodo({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final formKey = GlobalKey<FormState>();
  final taskNameController = TextEditingController();
  final folderController = TextEditingController();
  final notesController = TextEditingController();
  final priorityController = TextEditingController();
  final dueDateController = TextEditingController();

//   final radioController = TextEditingController();
//   final subTasks = <String>[];
//   final dep = <int>[];
//   DateTime dueDate = DateTime.now();
// final TextEditingController titleControl;
//   final TextEditingController priorityControl;
//   final TextEditingController folderControl;
//   final TextEditingController notesControl;
//   final TextEditingController dateControl;
//   final TextEditingController radioControl;
//   final DateTime dueDate;
  final toast = FToast();

  @override
  void initState() {
    super.initState();
// ASSIGN OLD VALUES
    taskNameController.text = widget.todo.taskName;
    folderController.text = widget.todo.folder;
    priorityController.text = widget.todo.priority;
    dueDateController.text = widget.todo.dueDate;
    notesController.text = widget.todo.notes;
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // String taskName = widget.todo.taskName;
    // String folder = widget.todo.folder;
    // String notes = widget.todo.notes;
    String priority = widget.todo.priority;
//     void clearSubs() => subTasks.clear();
//     dep.clear();
    // print(dueDateController.text);
    double selWidth = 150;
    List<Widget> Fields = [
      Input(
          hint: 'Update TaskName',
          prefixSize: M - 3,
          prefixIcon:
              useIcon(MdiIcons.formatListBulleted, Icons.format_list_bulleted),
          controller: taskNameController,
          version: 1),
      // SizedBox(height: M + 5),
      // ##################
      Folder(control: folderController, siz: selWidth),
      // SizedBox(height: S),
      // // ##################
      Priority(
          initialValue: priorityController.text.trim(),
          control: priorityController,
          siz: selWidth),
      // SizedBox(height: S),
      DueDate(
        control: dueDateController,
        dueDate: dueDateController.text == ''
            ? DateTime.now()
            : DateTime.parse(dueDateController.text),
        siz: selWidth,
      ),
      // SizedBox(height: M),
      Input(
          hint: 'Edit Notes...',
          prefixIcon: useIcon(MdiIcons.bookEdit, Icons.edit_note_sharp),
          controller: notesController,
          height: 130,
          version: 1),
      // SizedBox(height: S),
      // Radios(control: widget.radioControl),
      // SizedBox(height: XS)
//       Details(
//           titleControl: taskNameController,
//           notesControl: notesController,
//           priorityControl: priorityController,
//           dateControl: dueDateController,
//           radioControl: radioController,
//           folderControl: folderController,
//           dueDate: dueDate),
      // subTask(
      //     list: widget.todo.subtasks, dep: widget.todo.dep, callback: () {}),
      EditSub(list: widget.todo.subtasks)
    ];
    // String priority = widget.todo.priority;
    // List<int> dep = widget.todo.dep;
    // String dueDate = widget.todo.dueDate;
    // String folder = widget.todo.folder;
    // List<String> subtasks = widget.todo.subtasks;
    // String taskName = widget.todo.taskName;
    // String recurring = widget.todo.recurring;
    // String notes = widget.todo.notes;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body:
          // SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          // child:
          Scaffold(
              backgroundColor: colorUp(priority).withOpacity(.17),
              body: Stack(children: [
                Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: XL - 3, bottom: XS + 3),
                              child: Nav(
                                  version: 0,
                                  nav: 'Edit Todo',
                                  siz: M - 4.5,
                                  color: colorUp(priority),
                                  fnc: () {
                                    Navigator.pop(context);
                                  })),
                          Expanded(
                              child: Fader(
                                  child: ListView.separated(
                                      separatorBuilder: (_, i) =>
                                          SizedBox(height: S),
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          left: M,
                                          right: M,
                                          top: XS,
                                          bottom: L * 2),
                                      itemBuilder: (_, i) => Fields[i],
                                      itemCount: Fields.length))),
                          PillBtn(
                            col1: colorUp(priority).withOpacity(.45),
                            col2: colorUp(priority).withOpacity(.7),
                            fnc: () {
                              if (taskNameController.text.trim() == '') {
                                return;
                              }
                              // SHOW TOAST
                              //DISPLAY TOAST MESSAGE
                              toast.showToast(
                                  child: buildToast(
                                      colorUp(priority).withOpacity(.8),
                                      'Updating Todo',
                                      MdiIcons.update,
                                      Icons.update_rounded),
                                  gravity: ToastGravity.TOP);
                              // toast
                              context.read<AppCubits>().updateTodo(
                                    widget.todo,
                                    taskNameController.text,
                                    folderController.text,
                                    priorityController.text,
                                    dueDateController.text,
                                    notesController.text,
                                  );
                              Future.delayed(Duration(milliseconds: 500),
                                  () => Navigator.pop(context));
                              //     taskNameController.text.trim(),
                              //     notesController.text.trim(),
                              //     priorityController.text.trim(),
                              //     dueDateController.text.trim(),
                              //     radioController.text.trim(),
                              //     folderController.text.trim(),
                              //     subTasks,
                              //     dep);
                              // Timer(Duration(milliseconds: 250), () {
                              //   taskNameController.clear();
                              //   notesController.clear();
                              //   dueDateController.clear();
                              //   radioController.clear();
                              //   folderController.clear();
                              //   setState(() => dueDate = DateTime.now());
                              // });
                            },
                            marg:
                                EdgeInsets.only(bottom: M, left: XL, right: XL),
                            pad: EdgeInsets.symmetric(vertical: XS),
                            text: 'Update Todo',
                          )
                        ]))
              ])),
      // ),
    );
  }
}
