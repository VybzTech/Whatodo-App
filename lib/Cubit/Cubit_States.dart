// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

// class UserState extends CubitStates {
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

class AllDetailsState extends CubitStates {
  final List todos;
  final String title;
  AllDetailsState(this.title, this.todos);

  @override
  List<Object> get props => [title, todos];
}
