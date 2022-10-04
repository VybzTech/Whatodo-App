// ignore_for_file: prefer_const_constructors, file_names
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatodo/Screens/Archive/Archive.dart';
import 'package:whatodo/Screens/Bin/Recycle_Bin.dart';
import 'package:whatodo/Screens/Home/Todos.dart';
import 'package:whatodo/Screens/Notifications/Notification.dart';
import 'package:whatodo/Screens/Settings/Settings.dart';
import 'package:whatodo/Styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 2;

  void onTap(int index) => setState(() => pageIndex = index);

  void goSettings() => setState(() => pageIndex = 4);

  @override
  Widget build(BuildContext context) {
    // List<Map<String, Widget>> _screens = [

    List<Map<String, dynamic>> _screens = [
      {
        "name": "Archive",
        "widget": Archive(),
        "icon": useIcon(MdiIcons.briefcase, Icons.cases_rounded)
      },
      {
        "name": "Notification",
        "widget": Notifications(),
        'icon': useIcon(MdiIcons.bellBadge, Icons.notifications_active_rounded)
      },
      {
        "name": "Todos",
        "widget": Todos(goSettings: goSettings),
        "icon": useIcon(MdiIcons.formatListBulleted, Icons.format_list_bulleted)
      },
      {
        "name": "RecycleBin",
        "widget": RecycleBin(),
        "icon": useIcon(MdiIcons.delete, Icons.delete_rounded)
      },
      {
        "name": "Settings",
        "widget": Settings(),
        'icon': useIcon(MdiIcons.cog, Icons.settings)
      },
    ];
    // List<Map<String, dynamic>>
    // Map<String, dynamic> _screens = {
    //   // "name": "Archive",
    //   "Archive": useIcon(MdiIcons.briefcase, Icons.cases_rounded),
    //   "Notification":
    //       useIcon(MdiIcons.bellBadge, Icons.notifications_active_rounded),
    //   "Todos": useIcon(MdiIcons.formatListBulleted, Icons.format_list_bulleted),
    //   "RecycleBin": useIcon(MdiIcons.delete, Icons.delete_rounded),
    //   "Settings": useIcon(MdiIcons.cog, Icons.settings)
    // };

    // Widget screen = _screens[pageIndex]['widget'];
    List<Widget> screenList = [
      Archive(),
      Notifications(),
      Todos(goSettings: goSettings),
      RecycleBin(),
      Settings(),
    ];

    // return Scaffold(
    // body: screen
    // StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (_, snap) => snap.hasData
    //         ? _screens[pageIndex]["widget"]
    //         ? screen
    //         : Center(
    //             child: CircularProgressIndicator(),
    //           )),
//     List<Widget> children()
//     //=>
//     {
//       List<Widget> children = [];
//       // .iterator
//       children
//           .addAll(_screens.map((screen) {
//            screen.containsKey('widget')
// return
//           }
//           ));
//       // ['widget']
//       return children;
//     }
//  {
//         "name": "Archive",
//         "widget": Archive(),
//         "icon": useIcon(MdiIcons.briefcase, Icons.cases_rounded)
//       }

    // List<Widget> newList =  _screens.map((Map<> map)=>map['widget'].).toList();
    // .map((map) => map['widget']).toList();

    return Scaffold(
      body: IndexedStack(index: pageIndex, children: screenList),
      // ['widget']
      // ),
      // body: screen,
      // body: screen,
      backgroundColor: ThemeColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          elevation: 20.0,
          iconSize: M + 1.00,
          currentIndex: pageIndex,
          showSelectedLabels: true,
          selectedFontSize: S - 1.7,
          showUnselectedLabels: true,
          unselectedFontSize: S - 4.0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ThemeColors.blueOriginal.withOpacity(0.9),
          unselectedItemColor: ThemeColors.blueBlack.withOpacity(0.2),
          items: _screens
              .map((screen) => BottomNavigationBarItem(
                  label: screen['name'], icon: Icon(screen['icon'])))
              .toList()),
    );
  }

  // @override
  // void dispose() {
  //   //DISPOSE LOCAL STORAGE BOX
  //   Hive.close();
  //   // Hive.box<Todo>('Whatodo').close();
  //   super.dispose();
  // }
}
