import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posyandu/utils/baseurl.dart';

class ApiServices {
  static final String _url = MyUrl().getUrlDevice();
  static Future get(String endpoint) async {
    try {
      var response =
          await http.get(Uri.parse("$_url/$endpoint"), headers: _setHeaders());

      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  static Future post(String endpoint, Map<String, dynamic> params) async {
    try {
      var response = await http.post(Uri.parse("$_url/$endpoint"),
          headers: _setHeaders(), body: json.encode(params));

      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  static Map<String, String> _setHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
