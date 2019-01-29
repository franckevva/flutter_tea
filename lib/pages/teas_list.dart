import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:tea_app/service/api.dart';
import 'package:tea_app/components/tea_list.dart';
import 'package:tea_app/modals/tea.dart';

class TeaListPage extends StatefulWidget {
  @override
  createState() => _TeaListPageState();
}

class _TeaListPageState extends State {
  var _teaList = new List<Tea>();
  var _brand = '';

  _getTeas() {
    API.getTeas().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _teaList = list.map((model) => Tea.fromJson(model)).toList();

        /* todo: remove duplicate item */
        _brand = _teaList[0].brand;
        _teaList.addAll(list.map((model) => Tea.fromJson(model)).toList());
        _teaList.addAll(list.map((model) => Tea.fromJson(model)).toList());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getTeas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(_brand),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.0)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: new TeaList(_teaList),
      ),
    );
  }
}
