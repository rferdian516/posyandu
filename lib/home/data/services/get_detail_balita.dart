import 'package:http/http.dart' as http;
import 'package:posyandu/baseurl/baseurl.dart';
import 'dart:convert';

Future getDetailBalita(String name) async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/balita/get_by/name/$name";
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "Application/json"});

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
