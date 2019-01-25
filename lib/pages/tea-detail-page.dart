import 'package:flutter/material.dart';
import 'package:tea_app/modals/tea.dart';

class TeaDetailPage extends StatelessWidget {
  final TeaModal tea;

  TeaDetailPage({Key key, @required this.tea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Column(children: <Widget>[
            new Text(
              '${tea.name}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            new Text(
              '${tea.brand} | ${tea.receipt} recipes',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
          ]),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          /*bottom: new TabBar(tabs: <Tab>[
          new Tab(text: 'Popular'),
          new Tab(text: 'All Recipes'),
          new Tab(text: 'Friends'),
        ]),*/
        ),
        body: new SingleChildScrollView(
          child: new Container(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Container(
                      padding: EdgeInsets.all(15.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Original Recipe',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          new OutlineButton(
                            onPressed: () => {},
                            textColor: Colors.redAccent,
                            child: new Text('My Recipes'),
                          )
                        ],
                      )),
                  new Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: new Icon(Icons.receipt),
                          title: new Text(
                            'by Teaforia',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: new Text(
                            'used 275 times',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          trailing: new Icon(Icons.access_alarm),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Community',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          new OutlineButton(
                            onPressed: () => {},
                            textColor: Colors.redAccent,
                            child: new Text('Create Recipe'),
                          )
                        ],
                      )),
                  new ListView(shrinkWrap: true, children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: new Column(
                        children: <Widget>[
                          new ListTile(
                            leading: new Image.network(
                              'https://www.guidedogsvictoria.com.au/wp-content/themes/default/static/img/puppy.png',
                              height: 40.0,
                              width: 40.0,
                              repeat: ImageRepeat.noRepeat,
                              fit: BoxFit.contain,
                            ),
                            title: new Text(
                              'by Alice Parker',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: new Text(
                              'used 275 times',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            trailing: new Icon(Icons.access_alarm),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  new Image.network(tea.image),
                ],
              ),
            ),
          ),
        ));
  }
}
