import 'package:flutter/material.dart';

import 'package:tea_app/service/api.dart';
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                ),
                new Text(
                  '${tea.brand} | ${tea.receipt} recipes',
                  style: TextStyle(fontSize: 10.0),
                ),
              ]),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          textTheme: TextTheme(title: TextStyle(color: Colors.black)),
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
