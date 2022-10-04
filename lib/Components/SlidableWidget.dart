// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Styles.dart';

enum SlideActions { archive, delete }

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(SlideActions actions) onDismissed;

  const SlidableWidget(
      {Key? key, required this.child, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double extent = 0.2;
    return Slidable(
        child: child,
        key: const ValueKey(0),
        startActionPane: ActionPane(
            extentRatio: extent,
            // motion: const StretchMotion(),
            motion: ScrollMotion(),
            dismissible: DismissiblePane(
                onDismissed: () => onDismissed(SlideActions.archive)),
            children: [
              SlidableAction(
                  onPressed: (context) => onDismissed(SlideActions.archive),
                  backgroundColor: Colors.indigo.shade400,
                  foregroundColor: Colors.white,
                  icon: useIcon(MdiIcons.archive, Icons.archive_rounded)
                  // label: 'Archive'
                  )
            ]),
        endActionPane: ActionPane(
            extentRatio: extent,
            dismissible: DismissiblePane(
                onDismissed: () => onDismissed(SlideActions.delete)),
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: (context) => onDismissed(SlideActions.delete),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon:
                      useIcon(MdiIcons.deleteSweep, Icons.delete_sweep_rounded)
                  // label: 'Delete'
                  )
            ]));
  }
}
