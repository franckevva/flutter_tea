import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FakePage extends StatelessWidget {
  final String _title;

  FakePage(this._title);

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(_title),
          ],
        ),
      ),
    );
  }
}
