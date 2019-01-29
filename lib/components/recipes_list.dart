import 'package:flutter/material.dart';
import 'package:tea_app/modals/recipes.dart';
import 'package:tea_app/components/recipes_list_item.dart';

class RecipesList extends StatelessWidget {
  final List<Recipes> _list;
  final String _title;
  final String _buttonTitle;

  RecipesList(this._list, this._title, this._buttonTitle);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Container(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                _title,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              new FlatButton(
                onPressed: () => {},
                child: new Text(_buttonTitle),
              )
            ],
          )),
      new Column(children: _buildCommunityList())
    ]);
  }

  List _buildCommunityList() {
    return _list
        .map((item) => new Card(
              child: new RecipesListItem(item),
              margin: EdgeInsets.all(0.25),
              shape: new Border.all(style: BorderStyle.none),
            ))
        .toList();
  }
}
