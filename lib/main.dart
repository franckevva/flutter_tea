import 'package:flutter/cupertino.dart';
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
      theme: getThemeData(),
      initialRoute: '/teas',
      routes: <String, WidgetBuilder>{
        '/favorites': (BuildContext context) => new FirstTab(),
        '/teas': (BuildContext context) => new TeaPage(),
        '/account': (BuildContext context) => new ThirdTab(),
        '/settings': (BuildContext context) => new FirstTab(),
      },
    );
  }

  ThemeData getThemeData() {
    return new ThemeData(
      cardColor: Colors.white,
      dividerColor: Colors.grey,
      iconTheme: new IconThemeData(color: Colors.black),
      primaryColor: Colors.black,
      bottomAppBarColor: Colors.orange,
      tabBarTheme: new TabBarTheme(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0.0))),
      buttonTheme: ButtonThemeData(buttonColor: Colors.redAccent),
      accentColor: Colors.redAccent,
      textTheme: TextTheme(
        subtitle: TextStyle(fontStyle: FontStyle.italic),
        title: TextStyle(fontWeight: FontWeight.bold),
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
  TabController _pageController;
  int _currentIndex = 0;
  List<int> _history = [0];

  final List<Widget> _childrenTabs = [
    new FirstTab(),
    new TeaPage(),
    new ThirdTab(),
    new ThirdTab(),
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    _pageController =
        new TabController(length: _childrenTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    _pageController.dispose();
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
        controller: _pageController,
      ),
      bottomNavigationBar: getBottomNavigationBarTap(),
      /*new CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          Navigator.pushNamed(context, '/favorites');
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Favorites'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.landscape),
            title: new Text('Teas'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.supervised_user_circle),
            title: new Text('Account'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
        ],
      ),*/
    );
  }

  Widget getBottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new FirstTab()));
//        Navigator.pushNamed(context, '/favorites');
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.favorite),
          title: new Text('Favorites'),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.landscape),
          title: new Text('Teas'),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.supervised_user_circle),
          title: new Text('Account'),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.settings),
          title: new Text('Settings'),
        ),
      ],
      fixedColor: Colors.black,
    );
  }

  Widget getBottomNavigationBarTap() {
    return new Container(
      foregroundDecoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.0, color: Colors.grey))),
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
        // setup the controller
        controller: _pageController,
      ),
    );
  }
}
