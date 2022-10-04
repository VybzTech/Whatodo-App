// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class TaskList extends StatefulWidget {
  final List<String> list;
  const TaskList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Widget subTaskPill(key, String str) {
    return Column(
      key: key,
      children: [
        Padding(
            padding: const EdgeInsets.only(
                bottom: 8, right: M, left: XS / 2, top: XS + 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                          useIcon(
                            MdiIcons.circleMultiple,
                            Icons.fiber_smart_record_rounded,
                          ),
                          size: M,
                          color: ThemeColors.blueBlack.withOpacity(.55)),
                      SizedBox(width: 10),
                      SansText(
                          text: str,
                          weight: FontWeight.w400,
                          size: S + 4,
                          letter: 0.25,
                          color: ThemeColors.blueBlack.withOpacity(.8))
                    ],
                  ),
                  Icon(
                    useIcon(
                      MdiIcons.reorderHorizontal,
                      Icons.reorder_rounded,
                    ),
                    size: M + 1.5,
                    color: ThemeColors.blueBlack.withOpacity(.5),
                  )
                ])),
        Line()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: double.maxFinite,
          height: widget.list.length * 40,
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final listItem = widget.list.removeAt(oldIndex);
                widget.list.insert(newIndex, listItem);
              });
            },
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) =>
                subTaskPill(ValueKey(index), widget.list[index]),
          )),
      SizedBox(height: XS),
      InkWell(
          highlightColor: Colors.transparent,
          //CREATE NEW INPUT ND ADD USER TO TYPE ON IT IMMEDIATELY
          onTap: submitTask,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(useIcon(MdiIcons.plus, Icons.add),
                    color: ThemeColors.blueBlack.withOpacity(.65), size: M - 2),
                SizedBox(width: S),
                SansText(
                    text: 'Add a Subtask',
                    weight: FontWeight.w400,
                    color: ThemeColors.blueBlack.withOpacity(.65),
                    size: S + 2,
                    letter: 0.25,
                    word: 2)
              ])))
    ]);
  }

  submitTask() {
    showDialog(
        context: context,
        barrierColor: Color(0xbb111111),
        builder: (_) => BlocProvider.value(
            value: BlocProvider.of<AppCubits>(context),
            child: AlertDialog(
                title: Text('Create Subtask'),
                content: Input(
                    hint: 'I Ought to...',
                    version: 0,
                    controller: _controller,
                    prefixIcon: useIcon(MdiIcons.recordCircle,
                        Icons.fiber_manual_record_rounded)),
                actions: [
                  TapBtn(
                      fnc: () {
                        if (_controller.text.isEmpty) return;

                        widget.list.add(_controller.text.trim());
                        _controller.clear();
                        Timer(Duration(milliseconds: 150), () {
                          Navigator.of(context).pop();
                          setState(() {});
                        });
                      },
                      str: 'Save',
                      tap: prioColors.blue2)
                ])));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
