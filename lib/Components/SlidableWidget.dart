// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// 'package:flutter_slidable/src/widgets/slidable.dart';
// export 'package:flutter_slidable/src/widgets/slide_action.dart';

enum SlideActions { archive, delete }

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(SlideActions actions) onDismissed;

  const SlidableWidget(
      {Key? key, required this.child, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        child: child,
        actionPane: SlidableDrawerActionPane(),
        showAllActionsThreshold: 1,
        actions: [
          IconSlideAction(
            caption: 'Archive',
            color: Colors.indigo,
            icon: Icons.archive_rounded,
            onTap: () {
              onDismissed(SlideActions.archive);
            },
          )
        ],
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.redAccent,
            icon: Icons.delete,
            onTap: () {
              onDismissed(SlideActions.delete);
            },
          )
        ],
      );
}
