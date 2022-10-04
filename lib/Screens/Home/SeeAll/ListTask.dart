// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Tasks/Task_Preview.dart';
import 'package:whatodo/Styles.dart';

class ListTemp extends StatefulWidget {
  final Todo task;
  const ListTemp({Key? key, required this.task}) : super(key: key);

  @override
  State<ListTemp> createState() => _ListTempState();
}

class _ListTempState extends State<ListTemp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: XS),
        padding: EdgeInsets.only(top: S, bottom: S - 2.5, left: S, right: M),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ThemeColors.offWhite,
                spreadRadius: 0.15,
                blurRadius: XS,
              )
            ],
            border: Border.all(
                color: ThemeColors.lightGray.withOpacity(.25), width: 1.5),
            borderRadius: BorderRadius.circular(XS + 1)),
        child: InkWell(
            onTap: preview,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ICON & TASK TITTLE 'n' SUBTASKS
                  Row(children: [
                    Icon(
                      useIcon(
                          MdiIcons.folderOutline, Icons.folder_open_rounded),
                      color: colorUp(widget.task.priority),
                      size: L + .5,
                    ),
                    SizedBox(width: S),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SansText(
                              text: widget.task.taskName,
                              weight: FontWeight.w500,
                              color: ThemeColors.blueBlack.withOpacity(.8),
                              size: M - 4,
                              word: 0.5),
                          SizedBox(height: 1),
                          SansText(
                              text:
                                  '${widget.task.subtasks.length} SubTask${plural(widget.task.subtasks.length)}',
                              weight: FontWeight.w400,
                              color: ThemeColors.gray.withOpacity(.9),
                              size: S - 2)
                        ])
                  ]),
                  //SUBTASK PROGRESS INDICATOR
                  Column(children: [
                    SansText(
                        text: '0/${widget.task.subtasks.length.toString()}',
                        weight: FontWeight.w500,
                        color: colorUp(widget.task.priority),
                        size: S + 2),
                    SizedBox(height: 1),
                    Container(
                        alignment: Alignment.topLeft,
                        height: 2.5,
                        width: 35,
                        decoration: BoxDecoration(
                            color:
                                colorUp(widget.task.priority).withOpacity(.3),
                            borderRadius: BorderRadius.circular(XS / 2)),
                        child: Container(
                            color: colorUp(widget.task.priority),
                            height: 2.5,
                            width: 1))
                  ])
                ])));
  }

  void preview() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => BlocProvider<AppCubits>(
            create: (context) => AppCubits(),
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: DraggableScrollableSheet(
                  minChildSize: 0.5,
                  initialChildSize: 0.84,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                          ScrollController scrollController) =>
                      TaskPreview(task: widget.task),
                ))));
  }
}
