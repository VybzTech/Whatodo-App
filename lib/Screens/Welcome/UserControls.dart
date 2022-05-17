// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Screens/Welcome/SignUp.dart';
import 'package:whatodo/Styles.dart';

class UserControls extends StatefulWidget {
  bool anime;
  UserControls({Key? key, required this.anime}) : super(key: key);

  @override
  State<UserControls> createState() => _UserControlsState();
}

class _UserControlsState extends State<UserControls> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(L, 0, L, L),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => BlocProvider.of<AppCubits>(context).goHome(),
            child: MontText(
              text: 'Skip',
              weight: FontWeight.w700,
              color: ThemeColors.whitishBlue,
              size: M - 3,
            ),
          ),
          TextButton(
            onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => buildSheet(context)),
            child: MontText(
              text: 'Sign Up',
              weight: FontWeight.w700,
              color: ThemeColors.whitishBlue,
              size: M - 3,
            ),
          )
        ],
      ),
    );
  }

  Widget makeDissimible({context, required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet(context) => makeDissimible(
      context: context,
      child: DraggableScrollableSheet(
          initialChildSize: 0.825,
          maxChildSize: 0.85,
          builder: (context, scrollController) => SignUp()));
}
