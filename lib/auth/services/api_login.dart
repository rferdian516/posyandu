import 'package:http/http.dart' as http;
import 'package:posyandu/utils/baseurl.dart';
import 'dart:convert';

Future loginUser(String phoneNumber, String password) async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/login";
  final response = await http.post(Uri.parse(url), headers: {
    "Accept": "Application/json"
  }, body: {
    'phone_number': phoneNumber,
    'password': password,
  });

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
