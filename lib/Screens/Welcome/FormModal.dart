// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatodo/Components/Input.dart';
import 'package:whatodo/Styles.dart';

class FormModal extends StatefulWidget {
  const FormModal({Key? key}) : super(key: key);

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
// @override
  // void initState() {
  // ignore: todo
  // TODO: implement initState
  // super.initState();
//
  // }

  var space = SizedBox(height: L);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(top: XL, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
            hint: "Create a Username",
            prefixIcon: Icons.person,
            prefixed: true,
            prefixSize: M,
            controller: usernameController,
          ),
          space,
          Input(
            hint: "Create a Password",
            prefixIcon: Icons.password_rounded,
            prefixed: true,
            prefixSize: M,
            controller: passwordController,
          ),
          space,
          Input(
            hint: "ReType Password",
            prefixIcon: Icons.password_rounded,
            prefixed: true,
            prefixSize: M,
            controller: passwordCheckController,
          ),
          space,
          space,
          PillBtn(
            col1: ThemeColors.blue.withOpacity(.5),
            col2: ThemeColors.blueDark.withOpacity(.5),
            fnc: () {},
            marg: EdgeInsets.zero,
            rad: 5,
            pad: EdgeInsets.symmetric(vertical: S),
            child: MontText(
              text: 'Sign Up',
              size: S + 2,
              letter: 0.4,
              color: ThemeColors.offWhite.withOpacity(.5),
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ));
  }
}
