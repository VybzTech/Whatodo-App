import 'package:flutter/material.dart';

import '../../Styles.dart';

class Badge extends StatefulWidget {
  final String labelNo;

  const Badge({Key? key, required this.labelNo}) : super(key: key);

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: L - 3, //(25-3)
      width: L - 3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: ThemeColors.offWhite,
              spreadRadius: 0.2,
              blurRadius: XS,
              offset: const Offset(0.0, 1.0))
        ],
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ThemeColors.offWhite,
              ThemeColors.lightGray.withOpacity(0.6),
            ]),
      ),
      child: Center(
        child: SansText(
          text: widget.labelNo,
          weight: FontWeight.w600,
          color: ThemeColors.blueBlack,
          size: S - 1.5,
        ),
      ),
    );
  }
}
