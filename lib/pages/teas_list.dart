import 'package:flutter/material.dart';

import 'package:tea_app/services/api.dart';
import 'package:tea_app/components/tea_list.dart';
import 'package:tea_app/modals/tea.dart';

class TeaListPage extends StatefulWidget {
  @override
  createState() => _TeaListPageState();
}

class _TeaListPageState extends State {
  Future<List<Tea>> _teaList;
  final _brand = 'Adagio'; // fake brand name

  @override
  void initState() {
    super.initState();
    _teaList = ApiService.get().getTeas();
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
        child: FutureBuilder<List<Tea>>(
            future: _teaList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new TeaList(snapshot.data);
              } else if (snapshot.hasError) {
                return new Text('Ooop... ${snapshot.error}');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
