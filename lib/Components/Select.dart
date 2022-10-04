// ignore_for_file: prefer_if_null_operators, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Select extends StatefulWidget {
  final TextEditingController control;
  final dynamic initialValue;
  final List<DropdownMenuItem> itemsList;
  final EdgeInsets padding;
  final Widget icon;
  final void Function(dynamic) onchanged;
  final List<String> options;
  const Select({
    Key? key,
    required this.control,
    required this.itemsList,
    this.padding = EdgeInsets.zero,
    required this.options,
    required this.initialValue,
    required this.onchanged,
    required this.icon,
  }) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
          focusColor: ThemeColors.blueDark.withOpacity(.8),
          dropdownColor: Colors.white,
          isDense: true,
          decoration: InputDecoration(
              contentPadding: widget.padding, border: InputBorder.none),
          icon: widget.icon,
          elevation: 15,
          borderRadius: BorderRadius.circular(XS),
          iconSize: L - 2.8,
          value: widget.initialValue,
          items: widget.itemsList,
          onChanged: widget.onchanged));
}
