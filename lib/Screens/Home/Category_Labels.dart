// ignore_for_file: file_names, must_be_immutable,const_with_constant_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

class CategoryLabel extends StatefulWidget {
  List<String> categories;
  final void Function(int index) setter;
  CategoryLabel({Key? key, required this.categories, required this.setter})
      : super(key: key);

  @override
  _CategoryLabelState createState() => _CategoryLabelState();
}

class _CategoryLabelState extends State<CategoryLabel> {
  late ScrollController _scroller;
  int activeLabelIndex = 0;
  double labelPosition = 0;
  scrollListener() => setState(() => labelPosition = _scroller.position.pixels);

  @override
  void initState() {
    super.initState();

    _scroller = ScrollController();
    _scroller.addListener(() => scrollListener());
  }

  double scrollLR(bool left, double siz) =>
      left ? labelPosition - siz : labelPosition + siz;

  @override
  Widget build(BuildContext context) {
    double wide = MediaQuery.of(context).size.width / 2;
    return Stack(children: [
      ListView.builder(
          controller: _scroller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (_, index) {
            String content = widget.categories[index];
            return InkWell(
                onTap: () {
                  setState(() => activeLabelIndex = index);
                  widget.setter(activeLabelIndex);
                },
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(top: XS, bottom: XS),
                    width: wide - 5.0,
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: ThemeColors.lightGray.withOpacity(.7),
                              style: BorderStyle.solid,
                              width: 2.0)),
                    ),
                    child: Center(
                        child: MontText(
                      text:
                          content == 'All' ? 'GENERAL' : content.toUpperCase(),
                      weight: activeLabelIndex == index
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: activeLabelIndex == index
                          ? ThemeColors.blueBlack.withOpacity(0.8)
                          : ThemeColors.lightGray,
                      size: activeLabelIndex == index ? S + 2.5 : S + 1,
                      letter: activeLabelIndex == index ? -0.35 : -0.1,
                    ))));
          }),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HalfNav(
                left: true,
                divisor: scrollLR(true, wide),
                icon: Icon(
                    useIcon(MdiIcons.chevronLeft, Icons.chevron_left_rounded)),
                control: _scroller),
            HalfNav(
                divisor: scrollLR(false, wide),
                left: false,
                icon: Icon(useIcon(
                    MdiIcons.chevronRight, Icons.chevron_right_rounded)),
                control: _scroller),
          ])
    ]);
  }
}
