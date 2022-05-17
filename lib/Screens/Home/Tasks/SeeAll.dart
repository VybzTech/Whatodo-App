// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Components/NamedNav.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_States.dart';
import 'package:whatodo/Screens/Home/FIlter.dart';
import 'package:whatodo/Screens/Home/Tasks/GridTask.dart';
import 'package:whatodo/Screens/Home/Tasks/ListTask.dart';
import 'package:whatodo/Styles.dart';

class SeeAll extends StatefulWidget {
  SeeAll({Key? key}) : super(key: key);

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: ThemeColors.white,
        body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {
            int index;
            index = state.props[0].hashCode;
            String fil = filters[index]["filterName"];
            String filter = fil.substring(0, 1).toUpperCase() +
                fil.substring(1, fil.length).toLowerCase();
            var filterNo = filters[index]["filterNo"];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: XL + XS,
                ),
                //TOP STUFF
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Nav(
                        nav: filters[index]["filterName"].toUpperCase(),
                        // col: ThemeColors.gray,
                        siz: M,
                        version: 1,
                        fnc: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        }),
                    //SWITCH VIEW BUTTON
                    Row(
                      children: [
                        SquareBtn(
                            col: ThemeColors.blueDark,
                            fnc: () {
                              setState(() {
                                grid = !grid;
                              });
                            },
                            child: Icon(
                              grid
                                  ? Icons.grid_view_rounded
                                  : Icons.format_list_bulleted_rounded,
                              color: ThemeColors.offWhite,
                            ),
                            size: XL),
                        SizedBox(width: L - 2),
                      ],
                    )
                  ],
                ),
                SizedBox(height: S - 2),
                //DATE & TIME
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: L),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           SansText(
                //             text: '12:30',
                //             weight: FontWeight.w500,
                //             color: ThemeColors.gray,
                //             size: M,
                //           ),
                //           SansText(
                //             text: 'AM',
                //             weight: FontWeight.w500,
                //             color: ThemeColors.gray,
                //             size: S,
                //           )
                //         ],
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Row(
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               children: [
                //                 SansText(
                //                   text: '3',
                //                   weight: FontWeight.w500,
                //                   color: ThemeColors.gray,
                //                   size: M,
                //                 ),
                //                 SansText(
                //                   text: 'RD',
                //                   weight: FontWeight.w500,
                //                   color: ThemeColors.gray,
                //                   size: S,
                //                 ),
                //               ]),
                //           SizedBox(width: XS - 1.5),
                //           // Row(
                //           // crossAxisAlignment: CrossAxisAlignment.end,
                //           // children: [
                //           SansText(
                //               text: 'MARCH',
                //               weight: FontWeight.w500,
                //               color: ThemeColors.gray,
                //               size: S + 3),
                //           SizedBox(width: XS - 1.5),
                //           SansText(
                //               text: '2022',
                //               weight: FontWeight.w500,
                //               color: ThemeColors.gray,
                //               size: S + 3.5)
                //           // ],
                //           // ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: S),

                //DETAILS & PRIORITY
                Container(
                  padding: EdgeInsets.symmetric(horizontal: L),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SansText(
                        text: '$filterNo Tasks $filter',
                        weight: FontWeight.w500,
                        color: ThemeColors.gray,
                        size: S + 4,
                      ),
                      SansText(
                        text: 'Priority',
                        weight: FontWeight.w500,
                        color: ThemeColors.gray,
                        size: S,
                        letter: 0.55,
                      )
                    ],
                  ),
                ),
                //GRAPH OF STATISTIC
                WhiteBox(
                    marg: EdgeInsets.symmetric(horizontal: L, vertical: S),
                    height: XL * 3,
                    spread: 0.35,
                    shadow: ThemeColors.lightGray.withOpacity(.6),
                    width: double.maxFinite,
                    child: Center(child: Text("60% GRAPH TEMPLATE"))),
                //GRID VIEW OF TODOS
                Expanded(
                    child: WhiteBox(
                        bg: Color(0xfffafafa),
                        pad: EdgeInsets.only(
                            bottom: XL,
                            left: grid ? M : S - 2,
                            right: grid ? M : S - 2),
                        spread: 0.35,
                        shadow: ThemeColors.lightGray.withOpacity(.6),
                        marg: EdgeInsets.symmetric(horizontal: L, vertical: S),
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: getView(filterNo))),
                //ADD NEW TASK BUTTON
                ResBtn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: S + 2.5,
                        color: ThemeColors.offWhite,
                      ),
                      SizedBox(width: XS),
                      SansText(
                        text: 'Add a New Task',
                        weight: FontWeight.w400,
                        color: ThemeColors.offWhite,
                        size: S,
                      )
                    ],
                  ),
                  fnc: () {},
                  color1: ThemeColors.blueOriginal,
                  color2: ThemeColors.blue,
                  pad: EdgeInsets.symmetric(vertical: S + 2.5, horizontal: 0),
                  marg: EdgeInsets.only(left: L, right: L, bottom: M),
                )
              ],
            );
          },
        ));
  }

//SWITCH BTW GRID & LIST VIEW
  Widget getView(no) {
    if (grid) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15, crossAxisSpacing: 15, crossAxisCount: 2),
        itemCount: no,
        itemBuilder: (context, index) {
          return GridTemp(text: index.toString());
        },
      );
    } else {
      return ListView.separated(
        //  builder(
        separatorBuilder: (_, index) => SizedBox(
          height: S - 2,
        ),
        itemCount: no,
        itemBuilder: (context, index) {
          return ListTemp(text: index.toString());
        },
      );
    }
  }
}
