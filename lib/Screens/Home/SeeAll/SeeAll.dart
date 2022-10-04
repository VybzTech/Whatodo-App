// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';
import 'package:whatodo/Screens/Addition/Add_Todo.dart';
import 'package:whatodo/Screens/Home/SeeAll/GridTask.dart';
import 'package:whatodo/Screens/Home/SeeAll/ListTask.dart';
import 'package:whatodo/Screens/Home/SeeAll/SeeAll_Graph.dart';
import 'package:whatodo/Screens/Home/SeeAll/SeeAll_Header.dart';
import 'package:whatodo/Styles.dart';

class SeeAll extends StatefulWidget {
  final String title;
  final List todos;
  SeeAll({Key? key, required this.todos, required this.title})
      : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  bool grid = true;

  void setGrid() => setState(() => grid = !grid);

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBody: true,
      backgroundColor: ThemeColors.white,
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: L + 3),
              //TOP STUFF
              SeeAllHead(
                  no: widget.todos.length,
                  title: widget.title,
                  setGrid: setGrid,
                  grid: grid),
              SeeAllGraph(),
              Expanded(
                  child: WhiteBox(
                      bg: Color(0xfffafafa),
                      pad: EdgeInsets.only(
                          bottom: XL,
                          left: grid ? M : S - 2,
                          right: grid ? M : S - 2),
                      spread: 0.35,
                      shadow: ThemeColors.lightGray.withOpacity(.6),
                      marg: EdgeInsets.symmetric(horizontal: L, vertical: S),
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Fader(
                          col: Color(0xfffafafa),
                          child: getView(widget.todos.length)))),
              //ADD NEW TASK BUTTON
              ResBtn(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(useIcon(MdiIcons.plus, Icons.add),
                            size: S + 2.5, color: ThemeColors.offWhite),
                        SizedBox(width: XS),
                        SansText(
                            text: 'Add a New Task',
                            weight: FontWeight.w400,
                            color: ThemeColors.offWhite,
                            size: S)
                      ]),
                  color1: ThemeColors.blueOriginal,
                  color2: ThemeColors.blue,
                  pad: EdgeInsets.symmetric(vertical: S + 2.5, horizontal: 0),
                  marg: EdgeInsets.only(left: L, right: L, bottom: M),
                  fnc: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<AppCubits>(context),
                            child: AddTodo())));
                  })
            ]),
      ));

//SWITCH BTW GRID & LIST VIEW
  Widget getView(int num) => grid
      ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15, crossAxisSpacing: 15, crossAxisCount: 2),
          itemCount: num,
          itemBuilder: (context, index) => GridTemp(task: widget.todos[index]))
      : ListView.separated(
          separatorBuilder: (_, index) => SizedBox(height: S - 2),
          itemCount: num,
          itemBuilder: (context, index) => ListTemp(task: widget.todos[index]));
}
