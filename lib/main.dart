import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tea_app/pages/fake.dart';
import 'package:tea_app/pages/teas_list.dart';

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

  static ThemeData getThemeData() {
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

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _pageController;

  final List<Widget> _childrenTabs = [
    new FakePage('Favorites'),
    new TeaPage(),
    new FakePage('Account'),
    new FakePage('Settings'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController =
        new TabController(length: _childrenTabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: _childrenTabs,
        controller: _pageController,
      ),
      bottomNavigationBar: getBottomNavigationBarTap(),
    );
  }

  Widget getBottomNavigationBarTap() {
    return new Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1.0, color: Colors.grey[300]))),
      child: new TabBar(
        tabs: <Tab>[
          new Tab(
            icon: new Icon(Icons.favorite),
            text: 'Favorites',
          ),
          new Tab(
            icon: new Icon(Icons.landscape),
            text: 'Teas',
          ),
          new Tab(
            icon: new Icon(Icons.supervised_user_circle),
            text: 'Account',
          ),
          new Tab(
            icon: new Icon(Icons.settings),
            text: 'Settings',
          ),
        ],
        controller: _pageController,
      ),
    );
  }
}
