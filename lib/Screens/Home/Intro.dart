// ignore_for_file: prefer_const_constructors,file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatodo/Components/Todo.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Intro extends StatefulWidget {
  final Function ref;
  final Function goSettings;

  const Intro({Key? key, required this.ref, required this.goSettings})
      : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool avatar = false;
  String username = '';

  @override
  void initState() {
    super.initState();
    setUser();
  }

  setUser() async {
    final prefs = await SharedPreferences.getInstance();
    //   print(prefs.getString('username').toString());
    var user = prefs.getString('username').toString();
    //   user == ''
    //       ? setState(() {
    //           username = 'Username';
    //         })
    //       :
    setState(() {
      username = user;
      //           // prefs.getString('username') ?? 'Username';
      //           //   //  .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    //// User user = FirebaseAuth.instance.currentUser!;
    final int taskNumber = context.read<AppCubits>().todoList().length;
    // print(context.read<AppCubits>().todoList());
    // List<Todo> todoList = context.read<AppCubits>().todoList;
    // final int taskNumber = todoList.isNotEmpty ? todoList.length : 0;
    bool day = context.read<AppCubits>().timeOfDay();

//FILTERS LIST
    Widget menuRow(String text, IconData ico, bool active) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansText(
                  text: text,
                  weight: FontWeight.w400,
                  color: active
                      ? ThemeColors.blueOriginal.withOpacity(.7)
                      : ThemeColors.blueBlack.withOpacity(.8),
                  size: 15),
              SizedBox(width: S + 2),
              Icon(ico,
                  size: M - 1.5,
                  color: active
                      ? ThemeColors.blueOriginal.withOpacity(.7)
                      : ThemeColors.blueBlack.withOpacity(.7)),
            ]);

    PopupMenuEntry menu(
            {required IconData ico,
            required String text,
            required void Function()? fnc,
            required bool active}) =>
        PopupMenuItem(
            height: XL + 2.5,
            onTap: fnc,
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: menuRow(text, ico, active));
    List filterOption = [
      {
        'AndIcon': MdiIcons.checkCircle,
        'icon': Icons.domain_verification_rounded,
        'fnc': () => BlocProvider.of<AppCubits>(context).setFilter(''),
        'text': 'Default',
        'active': true
      },
      {
        'AndIcon': MdiIcons.alphaBCircle,
        'icon': Icons.abc_rounded,
        'fnc': () => BlocProvider.of<AppCubits>(context).setFilter('AZ'),
        'text': 'Alphabetical',
        'active': false
      },
      {
        'AndIcon': MdiIcons.calendarMonth,
        'icon': Icons.calendar_month,
        'fnc': () => BlocProvider.of<AppCubits>(context).setFilter('date'),
        'text': 'Date',
        'active': false
      },
    ];
    List<PopupMenuEntry> filterItems = filterOption
        .map((opt) => menu(
            ico: useIcon(opt['AndIcon'], opt['icon']),
            text: opt['text'],
            fnc: opt['fnc'],
            active: opt['active']))
        .toList();

//OPTIONS
    List<Map<String, dynamic>> optionList = [
      {
        'text': 'Filter',
        'AndIcon': MdiIcons.filterVariant,
        'icon': Icons.filter_list,
        'active': false,
        'fnc': () {
          Timer(
              Duration(milliseconds: 30),
              () => showMenu(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.5)),
                  elevation: 3,
                  position: RelativeRect.fromLTRB(55, 85, 25, 0),
                  // items: []));
                  items: filterItems));
        }
      },
      {
        'text': 'Refresh',
        'AndIcon': MdiIcons.rotateLeft,
        'icon': Icons.rotate_left_sharp,
        'fnc': widget.ref,
        'active': false
      },
      {
        'text': 'Settings',
        'AndIcon': MdiIcons.cog,
        'icon': Icons.settings_outlined,
        'fnc': widget.goSettings,
        'active': false
      },
      {
        'text': 'Log In',
        // 'text': user.emailVerified ? 'Log Out' : 'Log In',
        // 'icon': user.emailVerified ? Icons.logout_rounded : Icons.login_rounded,
        'AndIcon': MdiIcons.login,
        'icon': Icons.login_rounded,
        //SHOW LOGIN MODAL
        'fnc': () {},
        'active': false
      }
    ];

    List<PopupMenuEntry> items = optionList
        .map((opt) => menu(
            ico: useIcon(opt['AndIcon'], opt['icon']),
            text: opt['text'],
            fnc: opt['fnc'],
            active: opt['active']))
        .toList();

    void handleMenu() => showMenu(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.5)),
        context: context,
        elevation: 3,
        position: RelativeRect.fromLTRB(70, 85, 25, 0),
        // items: []);
        items: items);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 750),
              builder: (BuildContext context, double value, Widget? child) =>
                  Opacity(
                      opacity: value,
                      child: Padding(
                          padding: EdgeInsets.only(top: value * 15),
                          child: child)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MontText(
                              text: 'Good ${day ? 'Morning' : 'Evening'}',
                              size: S + 2,
                              letter: -0.25,
                              weight: FontWeight.w400),
                          SizedBox(width: XS - 2.8),
                          MontText(
                              // text: username,
                              text: username == '' ? 'Username' : username,
                              letter: -0.45,
                              size: M - 2,
                              weight: FontWeight.w500)
                        ]),
                    SizedBox(height: 1),
                    SansText(
                        text:
                            'You have ${taskNumber == 0 ? 'No' : taskNumber} pending task${plural(taskNumber)}',
                        size: S - .5,
                        weight: FontWeight.w400),
                    // SizedBox(height: 10.0)
                  ])),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 750),
              builder: (BuildContext context, double value, Widget? child) =>
                  AnimatedScale(
                      scale: value,
                      duration: Duration(milliseconds: 750),
                      child: child),
              child: InkWell(
                  // onTap: () {},
                  onTap: handleMenu,
                  onDoubleTap: () => setState(() => avatar = !avatar),
                  child: Stack(children: [
                    ImageWrapper(
                        imageUrl: avatar ? 'Images/Avatar.png' : '',
                        imageHeight: 57.0,
                        bordered: true),
                    Positioned(
                      right: -3,
                      top: -2,
                      child: IconBtn(
                        padValue: 1,
                        icoSize: 22,
                        col: ThemeColors.whitishBlue.withOpacity(.3),
                        fnc: () {},
                        icon: Icons.more_vert_rounded,
                        andIcon: MdiIcons.dotsVertical,
                      ),
                    )
                  ])))
        ]);
  }
}
