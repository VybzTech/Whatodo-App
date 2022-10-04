// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatodo/Components/Select.dart';
import 'package:whatodo/Components/WhiteBox.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Styles.dart';

class Folder extends StatefulWidget {
  final TextEditingController control;
  final double siz;
  Folder({Key? key, required this.control, required this.siz})
      : super(key: key);
  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> folders = [];
  String initialValue = 'All';

  @override
  void initState() {
    super.initState();
    setFolders();
    // setState(() => folders = Hive.box<String>('Folders').values.toList());
  }

  void setFolders() =>
      setState(() => folders = context.read<AppCubits>().folders());
  @override
  Widget build(BuildContext context) {
    void onchanged(dynamic val) => setState(() {
          initialValue = val;
          widget.control.text = initialValue;
        });

    void _displayDialog() async {
      showDialog(
          barrierColor: Color(0xbb111111),
          context: context,
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<AppCubits>(context),
              child: AlertDialog(
                  title: Text('Personalize Tasks'),
                  content: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (folderName) =>
                          folderName == '' ? 'Try Adding 4 or 5 Char' : null,
                      cursorColor: ThemeColors.blueDark,
                      cursorWidth: 1.75,
                      cursorHeight: L,
                      cursorRadius: Radius.circular(XS),
                      maxLength: 10,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      controller: _textFieldController,
                      decoration:
                          InputDecoration(hintText: 'Create a new Folder')),
                  actionsPadding: EdgeInsets.only(top: XS),
                  actions: <Widget>[
                    TapBtn(
                      fnc: () {
                        String folderName = _textFieldController.text.trim();
                        BlocProvider.of<AppCubits>(context)
                            .addFolder(folderName);
                        Future.delayed(Duration(milliseconds: 350), () {
                          _textFieldController.clear();
                          Navigator.of(context).pop();
                        });
                        Future.delayed(Duration(milliseconds: 500), () {
                          Navigator.of(context).pop();
                          setFolders();
                        });
                      },
                      str: 'Add',
                      tap: ThemeColors.blue,
                    ),
                    TapBtn(
                        str: 'Cancel',
                        tap: prioColors.red1,
                        fnc: () => Navigator.of(context).pop())
                  ])));
    }

    final List<DropdownMenuItem> foldersList = folders.map((folder) {
      return DropdownMenuItem(
          value: folder,
          onTap: () => setState(() {}),
          child: FolderPill(
            fnc: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    // setState(() {});
                    return BlocProvider.value(
                        value: BlocProvider.of<AppCubits>(context),
                        child: AlertDialog(
                            title: Text('Delete "$folder" Folder ?!'),
                            actionsPadding: EdgeInsets.only(top: S),
                            actions: <Widget>[
                              TapBtn(
                                fnc: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .deleteFolder(folder);
                                  Navigator.of(context).pop();
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  });
                                },
                                str: 'Yes',
                                tap: prioColors.green2,
                              ),
                              TapBtn(
                                fnc: () => Navigator.of(context).pop(),
                                str: 'No',
                                tap: prioColors.red2,
                              )
                            ]));
                  });
            },
            text: folder,
            btn: initialValue == folder || folder == 'All',
          ));
    }).toList();

    foldersList.add(DropdownMenuItem<String>(
        onTap: () {},
        enabled: false,
        alignment: AlignmentDirectional.center,
        child: Container(
            decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.circular(5.5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 0.1,
                      offset: Offset(0, 1.25))
                ]),
            width: 80,
            height: 35,
            child: InkWell(
                onTap: _displayDialog,
                child: Icon(
                  useIcon(MdiIcons.plus, Icons.add),
                  color: Colors.black87,
                  size: M,
                )))));

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MontText(
              text: 'Folder',
              weight: FontWeight.w600,
              size: M - 2.75,
              letter: -0.3,
              color: widget.control.text.isNotEmpty
                  ? ThemeColors.blueBlack
                  : ThemeColors.blueBlack.withOpacity(.65)),
          WhiteBox(
              pad: EdgeInsets.only(right: XS - 2, left: S + 2),
              spread: 1.5,
              blur: 7,
              shadow: ThemeColors.offWhite,
              radius: 5,
              height: 37,
              width: widget.siz,
              child: Select(
                  padding: EdgeInsets.only(bottom: S - .5),
                  control: widget.control,
                  itemsList: foldersList,
                  options: folders,
                  initialValue: initialValue,
                  onchanged: onchanged,
                  icon: SquareBtn(
                      shade: Colors.transparent,
                      col: Colors.transparent,
                      fnc: _displayDialog,
                      size: 25,
                      child: Icon(
                        useIcon(MdiIcons.plus, Icons.add),
                        color: Colors.black87,
                        size: M - 2.5,
                      ))))
        ]);
  }
}
