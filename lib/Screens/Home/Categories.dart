// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatodo/Components/Boxes.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Home/Category_Labels.dart';
import 'package:whatodo/Styles.dart';

class Categories extends StatefulWidget {
  final void Function(int index) setter;
  final List<String> categories;
  const Categories({Key? key, required this.setter, required this.categories})
      : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    // setState(() => _categories = context.read<AppCubits>().folders());
    // print(context.read<AppCubits>().folders());

    // print('context.read<AppCubits>().folders.toList()');
    // print(BlocProvider.of<AppCubits>(context).folders);
    // print(Boxes.getFolders().values.toList());

    //  Hive.box<String>('Folders').values.toList());
    // setState(() => _categories = Hive.box<String>('Folders').values.toList());
    // setState(() => _categories = BlocProvider.of<AppCubits>(context).folders);
    // print(_categories.length);
    // print(_categories);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categories.length == 1) {
      return Center(
          child: SansText(
              text: "All My Tasks",
              weight: FontWeight.w400,
              size: M - 2,
              word: 1.25,
              color: ThemeColors.blueBlack.withOpacity(.7)));
    } else {
      return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: XS, horizontal: 0.0),
          child: CategoryLabel(
              setter: widget.setter, categories: widget.categories));
    }
  }
}
