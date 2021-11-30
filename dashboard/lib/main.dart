import 'package:dashboard/screens/overlay/topbar.dart';
import 'package:dashboard/utils/dark_theme.dart';
import 'package:dashboard/utils/light_theme.dart';
import 'package:flutter/material.dart';
import 'screens/overlay/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dashboard | Opensight',
        debugShowCheckedModeBanner: false,
        darkTheme: buildDarkThemeData(context),
        theme: buildLightThemeData(context),
        home: Scaffold(
            body: Column(children: [
          TopBar(),
          Row(
            children: [Sidebar()],
          )
        ])));
  }
}
