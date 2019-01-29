import 'package:flutter/material.dart';

class Styles {
  static ThemeData getMainThemeData() {
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