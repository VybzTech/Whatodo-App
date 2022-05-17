// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:whatodo/Screens/Home/Category_Labels.dart';
import 'package:whatodo/Styles.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> _categories = [
    'Developer',
    'Disc Jockey',
    'Software Engr'
  ];
  late ScrollController _scroller;

  @override
  void initState() {
    super.initState();
    _scroller = ScrollController();
    _scroller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    double divisor = MediaQuery.of(context).size.width / 2;
    return Container(
      height: 53,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: XS, horizontal: 0.0),
      child: Stack(
        children: [
          //CATEGORY LABELS
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 7.0),
            child: CategoryLabel(control: _scroller, categories: _categories),
          ),
          //CATEGORY'S CONTROLLER BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HalfNav(
                  wit: 30.0, left: true, divisor: divisor, control: _scroller),
              HalfNav(
                  wit: 30.0, left: false, divisor: divisor, control: _scroller),
            ],
          ),
        ],
      ),
    );
  }
}
