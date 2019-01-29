import 'package:flutter/material.dart';

import 'package:tea_app/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final _homeStateKey = new GlobalKey<HomeState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea App',
      home: new HomePage(key: _homeStateKey),
      theme: getThemeData(),
    );
  }

  static ThemeData getThemeData() { /* todo: move to styles */
    return new ThemeData(
      cardColor: Colors.white,
      dividerColor: Colors.grey,
      iconTheme: new IconThemeData(color: Colors.black),
      primaryColor: Colors.black,
      tabBarTheme: new TabBarTheme(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0))),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
      accentColor: Colors.redAccent,
      textTheme: TextTheme(
        subtitle: TextStyle(fontStyle: FontStyle.italic),
        title: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
