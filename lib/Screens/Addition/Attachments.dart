// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:whatodo/Styles.dart';

class Attachment extends StatefulWidget {
  const Attachment({Key? key}) : super(key: key);

  @override
  State<Attachment> createState() => _AttachmentState();
}

class _AttachmentState extends State<Attachment> {
  dynamic noAttached = 0;
  String plural = '';

  List Attachments = [
    {
      "tip": "Voice Recorder",
      "ico": Icons.keyboard_voice_rounded,
      "sel": false
    },
    {"tip": "Video Recorder", "ico": Icons.videocam_rounded, "sel": false},
    {
      "tip": "Camera: Take Photo",
      "ico": Icons.photo_camera_rounded,
      "sel": false
    },
    {
      "tip": "Add Photos",
      "ico": Icons.add_photo_alternate_outlined,
      "sel": false
    },
  ];

  @override
  void initState() {
    super.initState();
    if (noAttached == 0) {
      setState(() => noAttached = 'No');
    } else if (noAttached > 1) {
      setState(() => plural = 's');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, M - 3, 12, XS),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MontText(
                text: 'Attachments',
                weight: FontWeight.w600,
                size: M + 2,
                letter: -0.2,
                color: Colors.black,
              ),
              SansText(
                text: '$noAttached Attachment$plural',
                weight: FontWeight.w400,
                color: ThemeColors.gray,
                size: S,
              ),
            ],
          ),
          SizedBox(
            height: XS,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: List.generate(
          //       Attachments.length,
          //       (int index) => IconBtn(
          //           sel: Attachments[index]["sel"],
          //           tip: Attachments[index]["tip"],
          //           fnc: () {
          //             changeSel(index);
          //           },
          //           icon: Attachments[index]["ico"])),
          // ),
        ]));
  }

  void changeSel(int index) => Attachments[index]["sel"] = true;
}
