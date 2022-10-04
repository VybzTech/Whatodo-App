// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors,file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Components/priorityColor.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';
import 'Tasks/Task_Preview.dart';

class TodoPreview extends StatefulWidget {
  final Todo todo;
  const TodoPreview({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  _TodoPreviewState createState() => _TodoPreviewState();
}

class _TodoPreviewState extends State<TodoPreview> {
  bool hovered = false;
  // Color todoColor = ThemeColors.blue;
  @override
  Widget build(BuildContext context) {
    Todo task = widget.todo;
    final int subs = task.subtasks.length;
    final List<Map> _dependencies =
        BlocProvider.of<AppCubits>(context).dependencies;

    return Container(
        height: 55,
        child: InkWell(
            onTap: () => handleNav(task),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: XS, right: S, top: XS - 1, bottom: S),
                            child: Icon(
                                useIcon(MdiIcons.folderOutline,
                                    Icons.folder_open_rounded),
                                size: L + 2.5,
                                color: colorUp(task.priority))),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MontText(
                                  text: task.taskName,
                                  weight: FontWeight.w600,
                                  color: ThemeColors.blueBlack.withOpacity(.9),
                                  size: S + 2,
                                  letter: -0.15),
                              SizedBox(height: 0.75),
                              SansText(
                                  text:
                                      '${subs > 0 ? subs.toString() : 'No'} Sub Task${plural(subs)}',
                                  size: S - 2,
                                  letter: .2,
                                  weight: FontWeight.w400,
                                  color: ThemeColors.gray),
                              Container(
                                  padding: EdgeInsets.only(top: 1),
                                  width: 100,
                                  height: S,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _dependencies.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(width: 1),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (task.dep.contains(index)) {
                                          return Icon(
                                              useIcon(
                                                  _dependencies[index]
                                                      ['AndIcon'],
                                                  _dependencies[index]['icon']),
                                              color: _dependencies[index]
                                                  ['col'],
                                              size: 12.5);
                                        }
                                        return SizedBox();
                                      }))
                            ])
                      ]),
                  IconButton(
                      onPressed: () => handleNav(widget.todo),
                      iconSize: L - 1.5,
                      padding: EdgeInsets.zero,
                      icon: Icon(useIcon(
                          MdiIcons.chevronRight, Icons.chevron_right_rounded)),
                      color: hovered
                          ? ThemeColors.blueBlack.withOpacity(.8)
                          : ThemeColors.lightGray.withOpacity(.8),
                      constraints:
                          BoxConstraints(maxHeight: M, maxWidth: M + XL))
                ])));
  }

  void handleNav(Todo todo) {
    setState(() => hovered = true);
    Timer(Duration(milliseconds: 150), () => setState(() => hovered = false));
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black.withOpacity(.15),
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
                      TaskPreview(task: todo),
                ))));
  }
}
