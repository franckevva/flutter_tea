import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      backgroundColor: Colors.red,
      child: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "First Tab",
                style: new TextStyle(color: Colors.white),
              ),
              new Image.network(
                'https://picsum.photos/250?image=9',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
