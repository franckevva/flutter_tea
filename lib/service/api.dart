import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'http://35.244.186.94/';

class API {
  static Future getTeas() {
    return http.get(baseUrl + '/teas');
  }
}
