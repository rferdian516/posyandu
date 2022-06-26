import 'package:http/http.dart' as http;
import 'package:posyandu/utils/baseurl.dart';
import 'dart:convert';

Future insertBalita(String name, String birthdate, String weight, String height,
    String parent, String gender) async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/balita/insert";
  final response = await http.post(Uri.parse(url), headers: {
    "Accept": "Application/json"
  }, body: {
    'name': name,
    'birthdate': birthdate,
    'weight': weight,
    'height': height,
    'parent': parent,
    'gender': gender
  });

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
