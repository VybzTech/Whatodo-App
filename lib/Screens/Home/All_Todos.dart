// ignore_for_file: file_names, prefer_const_constructors, avoid_function_literals_in_foreach_calls

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Screens/Addition/Radios.dart';
import 'package:whatodo/Styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Todo_Column.dart';

class AllTodos extends StatefulWidget {
  final BuildContext context;
  final List<Todo> todos;

  const AllTodos({Key? key, required this.context, required this.todos})
      : super(key: key);
  @override
  _AllTodosState createState() => _AllTodosState();
}

class _AllTodosState extends State<AllTodos> {
  List<Titling> titles = [];

  late filters filterType;

  @override
  void initState() {
    super.initState();
    filters filterType = BlocProvider.of<AppCubits>(context).switchFilter;
    checkTitles(filterType, titles);
    setUser();
  }

  String user = '';

  // final user = FirebaseAuth.instance.currentUser;
  // .displayName;

  setUser() async {
    final prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username').toString();
    //   user == ''
    //       ? setState(() {
    //           username = 'Username';
    //         })
    //       :
    setState(() {
      user = username;
      //           // prefs.getString('username') ?? 'Username';
      //           //   //  .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    sortTodos(widget.todos);

    if (widget.todos.isEmpty) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: M * 2, vertical: XL * 1.5),
                  child: Text(
                    '  Hello ${user == '' ? 'Friend,' : user} you currently have nothing to accomplish. Consider creating some todos with the add "+" button.',
                    // '  Hello ${user?.displayName == '' || user?.displayName == null ? 'Friend,' : user?.displayName} you currently have nothing to accomplish. Consider creating some todos with the add "+" button.',
                    style: TextStyle(
                        color: ThemeColors.blueBlack.withOpacity(.8),
                        fontSize: M - 4,
                        wordSpacing: 2.2,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  )),
              childCount: 1));
    } else {
      return SliverPadding(
          padding: EdgeInsets.only(bottom: XL * 1.5),
          sliver: SliverList(
              key: PageStorageKey<String>('FilerTitles'),
              delegate: SliverChildBuilderDelegate(
                  ((context, index) => TodoColumn(
                        index: index,
                        title: titles.elementAt(index).name,
                        todoList: titles.elementAt(index).array,
                      )),
                  childCount: titles.length)));
    }
  }

  DateTime today = DateTime.now();
  DateTime yesterday = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);
  DateTime tomorrow = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  int date(String date) => DateTime.parse(date).day;
//TASK SORTING LOGIC
  void checkTitles(filters type, List<Titling> titles) {
    if (type == filters.Nature) {
      titles.addAll(<Titling>[
        Titling(
            name: 'Overdue',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                    date(taskContent.dueDate) < today.day ||
                taskContent.createdTime.day <= yesterday.day),
        Titling(
            name: 'Today',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                    date(taskContent.dueDate) == today.day ||
                taskContent.createdTime.day == today.day &&
                    taskContent.recurring != TodoTime.recurring.name),
        Titling(
            name: 'Tomorrow',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                date(taskContent.dueDate) == tomorrow.day),
        Titling(
            name: 'Reminders',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.recurring == 'TodoTime.recurring' ||
                taskContent.recurring == TodoTime.recurring.name),
        Titling(
            name: 'Upcoming',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                date(taskContent.dueDate) > tomorrow.day),
      ]);
    } else if (type == filters.Date) {
      titles.addAll(<Titling>[
        Titling(
            name: 'Yesterday',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                    date(taskContent.dueDate) < today.day ||
                taskContent.createdTime.day <= yesterday.day),
        Titling(
            name: 'Today',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                    date(taskContent.dueDate) == today.day ||
                taskContent.createdTime.day == today.day),
        Titling(
            name: 'Tomorrow',
            array: [],
            checker: (Todo taskContent) =>
                taskContent.dueDate != '' &&
                date(taskContent.dueDate) == tomorrow.day),

        Titling(
            name: 'Last Week',
            array: [],
            checker: (Todo taskContent) {
              return false;
            }),
        Titling(
            name: 'Last Month',
            array: [],
            checker: (Todo taskContent) {
              return false;
            }),
        // Titling(
        //     name: 'Last Year',
        //     array: [],
        //     checker: (Todo taskContent) {
        //       return false;
        //     }),
        Titling(
            name: 'Next Week',
            array: [],
            checker: (Todo taskContent) {
              return false;
            }),
        Titling(
            name: 'Next Month',
            array: [],
            checker: (Todo taskContent) {
              return false;
            }),
        Titling(
            name: 'Next Year',
            array: [],
            checker: (Todo taskContent) {
              return false;
            })
      ]);
    }
  }

  void sortTodos(List<Todo> todoList) {
    if (todoList.isEmpty) return;
//FIRST UNSORT EVERYTHING
    titles.forEach((title) {
      title.array.removeRange(0, title.array.length);

      Iterable<Todo> newlySorted =
          todoList.where((todoContent) => title.checker(todoContent));
      title.array.addAll(newlySorted);
    });
  }
}
