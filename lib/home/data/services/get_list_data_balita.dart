import 'package:http/http.dart' as http;
import 'package:posyandu/utils/baseurl.dart';
import 'dart:convert';

Future getListBalita() async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/balita";
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "Application/json"});

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
