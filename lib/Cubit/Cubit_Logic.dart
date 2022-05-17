// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Addition/Add_Todo.dart';
import 'package:whatodo/Screens/Home/Tasks/SeeAll.dart';
import 'package:whatodo/Screens/Home/Tasks/Task_Preview.dart';
import 'package:whatodo/Screens/Welcome/FAQ.dart';
import 'package:whatodo/Screens/Welcome/SignUp.dart';
import 'package:whatodo/Screens/Welcome/User.dart';
import '../Screens/Home.dart';
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
          return Welcome(
              day: state.props.first.toString() == 'true' ? true : false);
        } else if (state is UserState) {
          return User(
              day: state.props.first.toString() == 'true' ? true : false);
        } else if (state is FaqState) {
          return FAQ();
        } else if (state is HomeState) {
          return Home();
        } else if (state is AddTodoState) {
          return AddTodo();
        } else if (state is AllDetailsState) {
          return SeeAll();
        } else if (state is DetailState) {
          return TaskPreview();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
