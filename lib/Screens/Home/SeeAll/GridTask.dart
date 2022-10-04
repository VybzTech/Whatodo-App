// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Tasks/Task_Preview.dart';
import 'package:whatodo/Styles.dart';

class GridTemp extends StatefulWidget {
  final Todo task;
  const GridTemp({Key? key, required this.task}) : super(key: key);

  @override
  State<GridTemp> createState() => _GridTempState();
}

class _GridTempState extends State<GridTemp> {
  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(vertical: XS, horizontal: XS - 1),
      margin: EdgeInsets.only(left: XS),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ThemeColors.offWhite.withOpacity(.7),
                spreadRadius: 0.25,
                blurRadius: XS)
          ],
          border: Border.all(
              color: ThemeColors.lightGray.withOpacity(.35), width: 2),
          borderRadius: BorderRadius.circular(XS)),
      child: InkWell(
          onTap: preview,
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                      useIcon(
                          MdiIcons.folderOutline, Icons.folder_open_rounded),
                      color: colorUp(widget.task.priority),
                      size: XL),
                ),
                SizedBox(height: XS * 1.7),
                SansText(
                    text: widget.task.taskName,
                    weight: FontWeight.w600,
                    color: ThemeColors.blueBlack.withOpacity(.8),
                    size: S + 1),
                SizedBox(height: XS / 2.5),
                SansText(
                    text:
                        '${widget.task.subtasks.length} SubTask${plural(widget.task.subtasks.length)}',
                    weight: FontWeight.w400,
                    color: ThemeColors.lightGray,
                    size: S)
              ]))));

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
                  //         builder: (context, scrollController) => Container()
                ))));
  }
}
