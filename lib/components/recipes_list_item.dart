import 'package:flutter/material.dart';

import 'package:tea_app/modals/recipes.dart';

class RecipesListItem extends StatelessWidget {
  final Recipes _item;

  RecipesListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      leading: new CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: new NetworkImage(_item.avatarUrl),
        radius: 30,
      ),
      title: new Text(
        'by ${_item.name}',
        style: TextStyle(fontWeight: Theme.of(context).textTheme.title.fontWeight),
      ),
      subtitle: new Text(
        'used ${_item.countOfUsed} times',
        style: Theme.of(context).textTheme.subtitle,
      ),
      trailing: _item.star ? new Icon(Icons.star) : null,
    );
  }
}
