// ignore_for_file: prefer_const_constructors,file_names
import 'package:flutter/material.dart';
import 'package:whatodo/Components/Boxes.dart';
import 'package:whatodo/Components/MyAddButton.dart';
import 'package:whatodo/Components/Refreshable.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Screens/Addition/Add_Todo.dart';
import 'package:whatodo/Screens/Home/All_Todos.dart';
import 'package:whatodo/Screens/Home/Categories.dart';
import 'package:whatodo/Screens/Home/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Todos extends StatefulWidget {
  final Function goSettings;
  const Todos({Key? key, required this.goSettings}) : super(key: key);

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  List<Todo> todoList = [];
  int activeFolderIndex = 0;
  Future loadTodos() async {
    await Future.delayed(Duration(milliseconds: 250));
    setState(() => todoList =
        BlocProvider.of<AppCubits>(context).folderList(activeFolderIndex));
    // todoList.forEach((todo) {
    //   print(todo.isDone);
    //   print('del val');
    //   print(todo.deleted);
    // });
  }

  @override
  void initState() {
    super.initState();
    context.read<AppCubits>().addDefaultFolder();
    loadTodos();
  }

  @override
  Widget build(BuildContext context) =>
      // Container();
      Scaffold(
          appBar: AppBar(
              elevation: 0,
              toolbarHeight: 180,
              titleSpacing: double.minPositive,
              title:
                  //  Container(),
                  Header(ref: loadTodos, goSettings: widget.goSettings),
              scrolledUnderElevation: XS - 3),
          //  ValueListenableBuilder<Box<Todo>>(
          //     // valueListenable: Boxes.getTodos().Listenable(),
          //     valueListenable: Boxes.getTodos().listenable(),
          //     builder: (BuildContext context, Box<Todo> box, Widget? child) {
          //       final Todos = box.values.toList().cast<Todo>();
          //       return buildContent(Todos);
          //     }),
          body: Refreshable(
              onRefresh: loadTodos,
              child: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  elevation: XS - 2,
                  expandedHeight: 70,
                  scrolledUnderElevation: XS,
                  backgroundColor: ThemeColors.white,
                  flexibleSpace: Categories(
                      setter: setActiveFolder,
                      categories: context.read<AppCubits>().folders()),
                ),
                AllTodos(context: context, todos: todoList),
              ])),
          backgroundColor: ThemeColors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: MyAddButton(
            symbol: '+',
            fnc: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<AppCubits>(context),
                      child: AddTodo())));
            },
            textSize: L + 5.5,
            wei: FontWeight.w400,
          ));

  void setActiveFolder(int index) {
    setState(() => activeFolderIndex = index);
    loadTodos();
  }
}
