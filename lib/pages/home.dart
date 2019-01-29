import 'package:flutter/material.dart';

import 'package:tea_app/pages/fake.dart';
import 'package:tea_app/pages/teas_list.dart';
import 'package:tea_app/components/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _pageController;

  final List<Widget> _childrenTabs = [
    new FakePage('Favorites'),
    new TeaListPage(),
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
      bottomNavigationBar: new BottomNavigation(_pageController),
    );
  }
}
