// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home.dart';
import 'package:whatodo/Screens/Home/SeeAll/SeeAll.dart';
import 'package:whatodo/Screens/Welcome/UserPage.dart';
import 'package:whatodo/Screens/Welcome/Welcome.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';

class CubitLogic extends StatefulWidget {
  const CubitLogic({Key? key}) : super(key: key);

  @override
  _CubitLogicState createState() => _CubitLogicState();
}

class _CubitLogicState extends State<CubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) {
        return Welcome();
        // } else if (state is UserState) {
        //   return UserPage();
      } else if (state is HomeState) {
        return Home();
      } else if (state is AllDetailsState) {
        return SeeAll(title: state.title, todos: state.todos);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }));
  }
}
