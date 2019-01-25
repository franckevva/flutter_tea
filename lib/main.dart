import 'package:flutter/material.dart';
import 'package:tea_app/pages/first.dart';
import 'package:tea_app/pages/tea-list-page.dart';
import 'package:tea_app/pages/third.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final _homeStateKey = new GlobalKey<HomeState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea App',
      home: new HomePage(key: _homeStateKey),
      theme: new ThemeData(
        cardColor: Colors.white,
        dividerColor: Colors.grey,
        iconTheme: new IconThemeData(color: Colors.black),
        primaryColor: Colors.black,
        tabBarTheme: new TabBarTheme(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicator:
                UnderlineTabIndicator(borderSide: BorderSide(width: 0.0))),
        buttonTheme: ButtonThemeData(buttonColor: Colors.redAccent),
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          subtitle: TextStyle(fontStyle: FontStyle.italic),
          title: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/*
*
* home: new MyTabbedPage(
        key: _myTabbedPageKey,
      ),*/

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController controller;
  final List<Widget> _childrenTabs = [
    new FirstTab(),
    new TeaPage(),
    new ThirdTab(),
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: _childrenTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Tea Application",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        children: _childrenTabs,
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Container(
        foregroundDecoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1.0, color: Colors.grey))),
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.favorite),
              text: 'Favorites',
            ),
            new Tab(
              icon: new Icon(Icons.landscape),
              text: 'Teas',
            ),
            new Tab(
                icon: new Icon(Icons.supervised_user_circle), text: 'Account'),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
