// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:whatodo/Components/Fader.dart';
import 'package:whatodo/Screens/Home/Todo_List.dart';
import 'package:whatodo/Screens/Home/Todo_Pill.dart';
import 'package:whatodo/Styles.dart';
import 'package:whatodo/Screens/Home/FIlter.dart';

class AllTodos extends StatefulWidget {
  const AllTodos({Key? key}) : super(key: key);

  @override
  _AllTodosState createState() => _AllTodosState();
}

class _AllTodosState extends State<AllTodos> {
  String shownFilter = 'today';
  callback(int filterIndex) {
    shownFilter == filters[filterIndex]["filterName"]
        ? setState(() {
            shownFilter = '';
          })
        : setState(() {
            shownFilter = filters[filterIndex]["filterName"];
          });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Fader(
        child: ListView.builder(
            itemCount: filters.length,
            itemBuilder: (_, index) {
              var condition = shownFilter == filters[index]['filterName'];
              return Column(
                children: [
                  TodoPill(
                    title: filters[index]['filterName'],
                    labelNo: filters[index]['filterNo'].toString(),
                    pillNo: index,
                    callback: callback,
                    toggleList: condition,
                  ),
                  condition
                      ? TodoList(num: filters[index]['filterNo'], index: index)
                      : SizedBox(
                          height: 1.5,
                        ),
                  SizedBox(
                    height: index == (filters.length - 1) ? XL : 2,
                  )
                ],
              );
            }),
      ),
    );
  }
}



//OLD LIST VIEW

            //RETURN COLUMN & LIST IF ITS SELECTED
            // if (shownFilter == filters[index]['filterName']) {
            //   return Column(
            //     children: [
            //       TodoPill(
            //         title: filters[index]['filterName'],
            //         labelNo: filters[index]['filterNo'].toString(),
            //         pillNo: index,
            //         callback: callback,
            //         toggleList: true,
            //       ),
            //       TodoList(num: filters[index]['filterNo'], index: index),
            //       SizedBox(
            //         height: XS - 2,
            //       )
            //     ],
            //   );
            // }
            // //RETURN COLUMN IF ITS NOT SELECTED
            // else {
            //   return Column(
            //     children: [
            //       TodoPill(
            //         title: filters[index]['filterName'],
            //         labelNo: filters[index]['filterNo'].toString(),
            //         pillNo: index,
            //         callback: callback,
            //       ),
            //       SizedBox(
            //         height: XS,
            //       )
            //     ],
            //   );
            // }