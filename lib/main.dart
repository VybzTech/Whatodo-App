// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatodo/Components/Todo.dart';
// import 'package:whatodo/Components/SWW.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_Logic.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('WhaTodo');
  await Hive.openBox<String>('Folders');

  // final prefs = await SharedPreferences.getInstance();
  // prefs.clear();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(), child: CubitLogic()));

  // Widget build(BuildContext context) => FutureBuilder(
  //       future: Firebase.initializeApp(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return SWW();
  //         }
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return MaterialApp(
  //               debugShowCheckedModeBanner: false,
  //               home: BlocProvider<AppCubits>(
  //                   create: (context) => AppCubits(), child: CubitLogic()));
  //         }
  //         return Center(child: CircularProgressIndicator.adaptive());
  //       },
  //     );
}
