// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

abstract class CubitStates extends Equatable {}

final int hour = int.parse(DateFormat('HH').format(DateTime.now()));
bool day = hour >= 7 && hour <= 19;

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [day];
}

class UserState extends CubitStates {
  @override
  List<Object> get props => [day];
}

// class SignUpState extends CubitStates {
//   @override
//   List<Object> get props => [];
// }

class FaqState extends CubitStates {
  @override
  List<Object> get props => [];
}

class HomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class AddTodoState extends CubitStates {
  @override
  List<Object> get props => [];
}

class AllDetailsState extends CubitStates {
  final int ind;
  AllDetailsState(this.ind);

  @override
  List<Object> get props => [ind];
}

class DetailState extends CubitStates {
  final int no;
  final int pillNum;
  DetailState(this.no, this.pillNum);

  @override
  List<Object> get props => [no, pillNum];
}
