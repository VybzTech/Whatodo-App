// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
    var timer = Timer(Duration(seconds: 5), () => {emit(UserState())});
  }

  void assignUser() {
    emit(UserState());
  }

  void addTodo() {
    emit(AddTodoState());
  }

  void faqPage() {
    emit(FaqState());
  }

  void goHome() {
    emit(HomeState());
  }

  void getDetails(int index, int pillNum) {
    emit(DetailState(index, pillNum));
  }

  void seeAll(int index) {
    emit(AllDetailsState(index));
  }
}
