import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:tea_app/modals/recipes.dart';

const baseUrl = 'http://35.244.186.94/';

class API {
  static Future getTeas() {
    return http.get(baseUrl + '/teas');
  }

  static getCommunityRecipes() {
    return <Recipes>[
      new Recipes('Justin Seal', true,
          'https://images.adagio.com/images2/icons/358375.jpg', 275),
      new Recipes('Alice Parker', false,
          'https://images.adagio.com/images2/icons/663374.jpg', 113),
      new Recipes('Philip Goldwasser', false,
          'https://images.adagio.com/images2/icons/310994.jpg', 77),
      new Recipes('Robin Corbett', false,
          'https://images.adagio.com/images2/icons/595692.jpg', 113),
      new Recipes('Justin Seal', false,
          'https://images.adagio.com/images2/icons/358375.jpg', 19),
    ];
  }

  static getOriginalRecipe() {
    return <Recipes>[
      new Recipes('Teaforis', true,
          'https://cdn1.iconfinder.com/data/icons/tea-3/512/14-512.png', 275),
    ];
  }
}
