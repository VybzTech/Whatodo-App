// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refreshable extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  const Refreshable({Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  State<Refreshable> createState() => _RefreshableState();
}

class _RefreshableState extends State<Refreshable> {
  @override
  Widget build(BuildContext context) =>
      Platform.isAndroid ? buildAndroidList() : buildIOSList();

  Widget buildAndroidList() =>
      RefreshIndicator(child: widget.child, onRefresh: widget.onRefresh);

  Widget buildIOSList() =>
      CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
        SliverToBoxAdapter(child: widget.child)
      ]);
}
