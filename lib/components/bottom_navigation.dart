import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final TabController _pageController;

  BottomNavigation(this._pageController);

  @override
  Widget build(BuildContext context) {
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
