// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, constant_identifier_names, file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatodo/Cubit/App_Cubits.dart';
import 'package:whatodo/Cubit/Cubit_Logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(),
        child: CubitLogic(),
      ),
      debugShowCheckedModeBanner: false,
      /*
      GlobalKey<NavigatorState>? navigatorKey,
      GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
       Widget Function(BuildContext)> routes = const <String,WidgetBuilder>{},
      String? initialRoute,
       Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
        List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
         Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
         List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
         Widget Function(BuildContext,
          Widget?)? builder,
          String title = '',
         String Function(BuildContext)? onGenerateTitle,
         Color? color,
         ThemeData? theme,
         ThemeData? darkTheme,
          ThemeData? highContrastTheme,
          ThemeData? highContrastDarkTheme,
           ThemeMode? themeMode = ThemeMode.system,
            Locale? locale,
            Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
             Locale? Function(List<Locale>?,
             Iterable<Locale>)? localeListResolutionCallback,
             Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
              Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
               bool debugShowMaterialGrid = false,
               bool showPerformanceOverlay = false
               , bool checkerboardRasterCacheImages = false,
               bool checkerboardOffscreenLayers = false,
               bool showSemanticsDebugger = false,
                 Map<ShortcutActivator,
                 Intent>? shortcuts,
                 Map<Type, Action<Intent>>? actions,
                 String? restorationScopeId,
                 ScrollBehavior? scrollBehavior,
                  bool useInheritedMediaQuery = false
//      initialRoute: '/',
//      routes: {
////        '/': (context) => Welcome(),
//        '/': (context) => Home(),
//      },
      * */
    );
  }
}
