import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tea_app/modals/recipes.dart';
import 'package:tea_app/modals/tea.dart';

const baseUrl = 'http://35.244.186.94/';

class ApiService {
  /* storage teaList on memory for test;
  *  in future it possible to storage data on db with sqflite package,
  *  as example
  * */
  List<Tea> _teaList = new List<Tea>();
  String _lastModified = '';

  static final ApiService _api = new ApiService();

  static ApiService get() {
    return _api;
  }

  Future<List<Tea>> getTeas() async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (_lastModified.isNotEmpty) {
      headers['If-Modified-Since'] = _lastModified;
    }

    final response = await http.get('$baseUrl/teas', headers: headers);

    if (response.headers.containsKey('last-modified')) {
      _lastModified = response.headers['last-modified'];
    }

    if (response.statusCode == 200) {
      /* can be processing 304 status code,
      * when data didn't change from last time
      * depended on server realisation
      * */
      final list = json.decode(response.body);
      _teaList.addAll(list.map<Tea>((model) => Tea.fromJson(model)).toList());

      /* todo: remove duplicate item */
      /* added more data for example */
      _teaList.addAll(list.map<Tea>((model) => Tea.fromJson(model)).toList());
      _teaList.addAll(list.map<Tea>((model) => Tea.fromJson(model)).toList());

      return _teaList;
    } else {
      throw Exception('Failed to load teas');
    }
  }

  /* fake data for community list on tea details page */
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

  /* fake data for part of tea details page */
  static getOriginalRecipe() {
    return <Recipes>[
      new Recipes('Teaforis', true,
          'https://cdn1.iconfinder.com/data/icons/tea-3/512/14-512.png', 275),
    ];
  }
}
