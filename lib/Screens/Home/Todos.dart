// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatodo/Components/MyAddButton.dart';
import 'package:whatodo/Screens/Home/All_Todos.dart';
import 'package:whatodo/Screens/Home/Categories.dart';
import 'package:whatodo/Screens/Home/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Todos extends StatelessWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            height: 222.0,
            begin: ThemeColors.blueOriginal,
            end: ThemeColors.blue,
            dated: true,
          ),
          Categories(),
          // Container(
          //   padding: EdgeInsets.only(top: L + S),
          //   child: SansText(
          //     text: 'There are no available Todos Today',
          //     weight: FontWeight.w600,
          //     size: M - 4,
          //     color: ThemeColors.gray.withOpacity(.7),
          //   ),
          // ),
          AllTodos(),
          SizedBox(
            height: M,
          ),
        ],
      ),
      backgroundColor: ThemeColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: MyAddButton(
        symbol: '+',
        fnc: () {
          context.read<AppCubits>().addTodo();
        },
        textSize: L + 5.5,
        wei: FontWeight.w400,
      ),
    );
  }
}
