import 'package:flutter/material.dart';

class Styles {
  static ThemeData getMainThemeData() {
    return new ThemeData(
      cardColor: Colors.white,
      dividerColor: Colors.grey[300],
      iconTheme: new IconThemeData(color: Colors.black),
      primaryColor: Colors.black,
      backgroundColor: Colors.white,
      tabBarTheme: new TabBarTheme(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey[600],
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0))),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
      accentColor: Colors.redAccent,
      textTheme: TextTheme(
        subtitle: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),
        title: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}