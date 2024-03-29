import 'dart:convert';
import 'package:http/http.dart' as http;

class MyUrl {
  // final String _url = "http://192.168.99.43:8888/api";
  final String url = "https://posyandu.rumahrahileducation.com";
  String getUrlDevice() {
    return url + '/api';
  }

  postData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
