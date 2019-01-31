import 'package:flutter/material.dart';

import 'package:tea_app/services/api.dart';
import 'package:tea_app/modals/tea.dart';
import 'package:tea_app/components/recipes_list.dart';

class TeaDetailPage extends StatelessWidget {
  final Tea tea;

  TeaDetailPage({Key key, @required this.tea}) : super(key: key);

  _getCommunityRecipes() {
    return ApiService.getCommunityRecipes();
  }

  _getOriginalRecipe() {
    return ApiService.getOriginalRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  '${tea.name}',
                  style: TextStyle(fontSize: 18.0),
                ),
                new Text(
                  '${tea.brand} | ${tea.receipt} recipes',
                  style: TextStyle(fontSize: 10.0),
                ),
              ]),
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).backgroundColor,
          textTheme: Theme.of(context).textTheme,
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new RecipesList(
                  _getOriginalRecipe(), 'Original Recipe', 'My Recipes'),
              new RecipesList(
                  _getCommunityRecipes(), 'Community', 'Create Recipe'),
            ],
          ),
        ));
  }
}
