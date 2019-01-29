import 'package:flutter/material.dart';

import 'package:tea_app/styles.dart';
import 'package:tea_app/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final _homeStateKey = new GlobalKey<HomeState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea App',
      home: new HomePage(key: _homeStateKey),
      theme: Styles.getMainThemeData(),
    );
  }
}
