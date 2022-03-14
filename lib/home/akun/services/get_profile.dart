import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:posyandu/baseurl/baseurl.dart';

Future getProfile(String phoneNumber) async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/profile/$phoneNumber";
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
    // 'Authorization': 'Bearer $token'
  });
  // print('Token : ${token}');
  print(response.body);

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
