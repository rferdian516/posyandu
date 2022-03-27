import 'dart:convert';
import 'package:http/http.dart' as http;

class MyUrl {
  // String _url = "http://192.168.0.113:88/api";
  String _url = "http://posyandu-itn.herokuapp.com/api";
  String getUrlDevice() {
    return this._url;
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
