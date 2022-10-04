// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Boxes.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';
import 'Task_Details.dart';

class TaskPreview extends StatefulWidget {
  final Todo task;
  const TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  bool col = false;
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      Positioned.fill(top: 0, child: TaskDetails(task: widget.task)),
      //CLOSE BUTTON
      Positioned(
          top: 10,
          right: S - 2,
          child: IconBtn(
              fnc: () {
                Navigator.pop(context);
                Fluttertoast.showToast(
                    msg: 'Pull to Refresh',
                    backgroundColor: ThemeColors.blue.withOpacity(.96),
                    textColor: ThemeColors.white,
                    gravity: ToastGravity.BOTTOM);
              },
              col: ThemeColors.blueBlack,
              icon: Icons.cancel,
              andIcon: MdiIcons.closeThick,
              icoSize: M)),
      //DELETE BUTTON
      Positioned(
          bottom: XL + 2,
          right: S,
          child: CompBtn(
            child: Icon(useIcon(MdiIcons.delete, Icons.delete_rounded),
                size: M + 2, color: ThemeColors.white),
            size: L * 1.85,
            color1: colorUp(widget.task.priority).withOpacity(.5),
            color2: colorUp(widget.task.priority).withOpacity(.8),
            fnc: () {
              showDialog(
                  context: context,
                  barrierColor: Color(0xbb111111),
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<AppCubits>(context),
                      child: AlertDialog(
                          title: Text('Delete, ${widget.task.taskName} ?'),
                          actions: [
                            TapBtn(
                                fnc: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .setTodoDel(widget.task);
                                  Fluttertoast.showToast(
                                      msg: 'Deleting Todo',
                                      backgroundColor:
                                          prioColors.red2.withOpacity(.3),
                                      textColor:
                                          ThemeColors.white.withOpacity(.7),
                                      gravity: ToastGravity.TOP);
                                  setState(() => clicked = true);

                                  Future.delayed(Duration(milliseconds: 350),
                                      () => Navigator.of(context).pop());
                                },
                                str: 'Yes',
                                tap: prioColors.green2),
                            TapBtn(
                                fnc: () {
                                  Navigator.of(context).pop();
                                },
                                str: 'No',
                                tap: prioColors.red1)
                          ])));
            },
          )),
      //DONE BUTTON
      Positioned(
          bottom: XL * 2.43,
          right: S,
          child: CompBtn(
            child: Icon(
                useIcon(
                    MdiIcons.checkboxMarkedCircleOutline, Icons.done_rounded),
                size: M + 2,
                color: ThemeColors.white),
            size: L * 1.85,
            fnc: () {
              showDialog(
                  context: context,
                  barrierColor: Color(0xbb111111),
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<AppCubits>(context),
                      child: AlertDialog(
                          title: Text(
                              'Have you Completed, ${widget.task.taskName} ?'),
                          // content: Input(
                          //     hint: 'I Ought to...',
                          //     version: 0,
                          //     controller: _controller,
                          //     prefixIcon: useIcon(MdiIcons.recordCircle,
                          //         Icons.fiber_manual_record_rounded)),
                          actions: [
                            TapBtn(
                                fnc: () {
                                  //CONFIRM WITH MODAL
                                  BlocProvider.of<AppCubits>(context)
                                      .setTodoDone(widget.task, true);
                                  // widget.list.add(_controller.text.trim());
                                  // _controller.clear();
                                  // Timer(Duration(milliseconds: 150), () {
                                  Fluttertoast.showToast(
                                      msg: 'Completed Todo',
                                      backgroundColor:
                                          prioColors.green1.withOpacity(.3),
                                      textColor:
                                          ThemeColors.white.withOpacity(.7),
                                      gravity: ToastGravity.TOP);
                                  Future.delayed(Duration(milliseconds: 350),
                                      () => Navigator.of(context).pop());
                                  setState(() {
                                    clicked = true;
                                  });
                                  // });
                                },
                                str: 'Yes',
                                tap: prioColors.green2),
                            TapBtn(
                                fnc: () {
                                  // widget.list.add(_controller.text.trim());
                                  // _controller.clear();
                                  // Timer(Duration(milliseconds: 150), () {
                                  Navigator.of(context).pop();
                                  //   setState(() {});
                                  // });
                                },
                                str: 'No',
                                tap: prioColors.red1)
                          ])));
            },
            color1: colorUp(widget.task.priority).withOpacity(.55),
            color2: colorUp(widget.task.priority).withOpacity(.85),
          ))
    ]));
  }
}
