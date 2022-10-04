// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names, non_constant_identifier_names

// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatodo/Components/Boxes.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';
// import 'package:whatodo/Screens/Addition/Add_Todo.dart';
import 'package:whatodo/Styles.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
    // var timer = Timer(Duration(seconds: 5), () => {emit(HomeState())});
  }
  // emit(UserState()

// ######################################################
//  HOME

  bool timeOfDay() {
    final int hour = int.parse(DateFormat('HH').format(DateTime.now()));
    return hour >= 7 && hour <= 19;
  }

  void setShowHome(bool showHome) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("showHome", showHome);
  }

  // bool getShowHome( showHome) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.getBool("showHome");
  // // }
  void setUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("username", user);
  }

  // String getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var user = prefs.getString("username").toString();
  //   return user;
  // }

  void deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    prefs.remove('username');
    prefs.setBool('showHome', false);
    emit(WelcomeState());
  }
  // void assignUser() {
  //   emit(UserState());
  // }

  void goHome() {
    emit(HomeState());
  }

  void seeAll(String title, List todos) {
    emit(AllDetailsState(title, todos));
  }

// var time = Timer(
//       Duration(seconds: 3),
//       () => {
//             addTask(
//                 'New Task Two', "Some notes", 'Medium', '20220824', '', 'All', [
//               'buy bread',
//               'get trousers',
//             ], [
//               2,
//               6
//             ])
//           });
// ######################################################
//  MY TO'DO LIST
  // final List<Todo> todoList = <Todo>[];

  List<Todo> todoList() {
    List<Todo> newList = Boxes.getTodos().values.toList();

    return newList
        .where((todo) => !todo.archived && !todo.isDone && !todo.deleted)
        // .skipWhile((todo) => todo.deleted)
        .toList();
    // ;......................false......||......true...... ...= true
    //  Boxes.getTodos()
    // .values
    // .cast<Todo>();
  }

  // List<Todo> get todoList => Boxes.getTodos()
  //     .values
  //     .where((todo) =>
  //         //CHECK IF TO'DO IS NOT ARCHIVED, DELETED, OR DONE
  //         todo.archived || todo.deleted || todo.isDone)
  //     .toList();

// ######################################################

  // List<Todo> get archivedList => _todos.where((todo) => todo.archived).toList();
  // List<Todo> get deletedList => _todos.where((todo) => todo.deleted).toList();
  // List<Todo> get untiqueTodos =>
  //     _todos.skipWhile((odo) => todo.archived || todo.deleted).toList();
//   List<Todo> todosList() {
// return
//     _todos.skipWhile((todo) => todo.archived||todo.deleted).toList();  }

  // void addTask(
  //     taskName, notes, prior, dueDate, recurring, folder, subTasks, dep) {
  //   _todos.add(Todo(
  //       id: IdClass().generate(),
  //       createdTime: DateTime.now(),
  //       taskName: taskName,
  //       folder: folder,
  //       notes: notes,
  //       priority: prior,
  //       dueDate: dueDate,
  //       recurring: recurring,
  //       subtasks: subTasks,
  //       dep: dep));
  // }

  void addTodo(Todo newTodo) {
    final box = Boxes.getTodos();
    // box.add(newTodo);
    box.put(newTodo.id, newTodo);
  }

  // =>      _todos.removeWhere((task) => task.id == taskId);

  void updateTodo(Todo todo, String taskName, String folder, String priority,
      String dueDate, String notes) {
    todo.taskName = taskName;
    todo.folder = folder;
    todo.priority = priority;
    todo.dueDate = dueDate;
    todo.notes = notes;
    // todo.save();
    final box = Boxes.getTodos();
    box.put(todo.id, todo);
  }

  void deleteTodo(Todo del) {
    del.delete();
    // final box = Boxes.getTodos();
    // box.delete(del.id);
  }

  void setTodoDel(Todo todo) {
    todo.deleted = true;
    todo.save();
  }

  void setTodoDone(Todo todo, bool isDone) {
    todo.isDone = isDone;
    todo.save();
    // final box = Boxes.getTodos();
    // box.put(todo.id, todo);
  }
  // void deleteTask(int taskId) =>
  //     _todos.removeWhere((task) => task.id == taskId);

  // void updateTask(Todo todo, String taskName, String folder, String priority,
  //     String notes) {
  //   todo.taskName = taskName;
  //   todo.folder = folder;
  //   todo.priority = priority;
  //   todo.notes = notes;
  // }

  // List<Todo> get todosList => _todos;
  // List<Todo> get archivedList => _todos.where((todo) => todo.archived).toList();
  // List<Todo> get deletedList => _todos.where((todo) => todo.deleted).toList();
  // List<Todo> get untiqueTodos =>
  //     _todos.skipWhile((odo) => todo.archived || todo.deleted).toList();
//   List<Todo> todosList() {
// return
//     _todos.skipWhile((todo) => todo.archived||todo.deleted).toList();  }

// ######################################################
//  FOLDERS
  // List<String> folders = Boxes.getFolders().values.toList();
  List<String> folders() {
    List<String> folderList = Boxes.getFolders().values.toList();
    return folderList;
  }

  void addDefaultFolder() {
    Boxes.getFolders().values.contains('All')
        ? null
        : Boxes.getFolders().add('All');
  }

  final foldersBox = Boxes.getFolders();

  void addFolder(String str) {
    foldersBox.add(str);
  }

  void deleteFolder(String str) {
    foldersBox.delete(str);
  }

  //FILTER TO'DO LIST TO FOLDERS (GENERAL,DEV,ENGR)
  List<Todo> folderList(int folderIndex) {
    List<Todo> deliverable = [];

    if (folderIndex > 0) {
      deliverable.addAll(todoList().where((Todo todo) =>
          todo.folder.toLowerCase() ==
          folders().elementAt(folderIndex).toLowerCase()));

      // Boxes.getFolders()
      //     .values
      //     .toList()
      //     .elementAt(folderIndex).toLowerCase()));
    }
    if (folderIndex == 0) {
      //if its All folder, add all todo that're not archived||deleted||Done
      deliverable.addAll(todoList());
      // deliverable.addAll(todoList
      //     .skipWhile((todo) => todo.archived || todo.deleted || todo.isDone));
    }
    return deliverable;
  }

// ######################################################
//  FILTERS  (OVERDUE TODAY)
  String filterName = '';

  void setFilter(name) => filterName = name;

  filters get switchFilter {
    if (filterName == 'date') {
      return filters.Date;
    } else {
      return filters.Nature;
    }
  }

// ######################################################
// TASK DEPENDENCIES
  List<Map<String, dynamic>> dependencies = [
    {
      'index': 0,
      "AndIcon": MdiIcons.wifi,
      "icon": Icons.wifi_rounded,
      "col": prioColors.blueDeep1
    },
    {
      'index': 1,
      "AndIcon": MdiIcons.currencyUsd,
      "icon": Icons.attach_money_rounded,
      "col": prioColors.green1
    },
    {
      'index': 2,
      "AndIcon": MdiIcons.link,
      "icon": Icons.insert_link_rounded,
      "col": prioColors.orange2
    },
    {
      'index': 3,
      "AndIcon": MdiIcons.cellphone,
      "icon": Icons.phone_iphone_rounded,
      "col": prioColors.pink1
    },
    {
      'index': 4,
      "AndIcon": MdiIcons.laptop,
      "icon": Icons.laptop_mac,
      "col": prioColors.purple3
    },
    {
      'index': 5,
      "AndIcon": MdiIcons.phone,
      "icon": Icons.phone,
      "col": prioColors.lemon2
    },
    {
      'index': 6,
      "AndIcon": MdiIcons.cannabis,
      "icon": Icons.smoking_rooms_rounded,
      "col": prioColors.green3
    },
  ];
}
