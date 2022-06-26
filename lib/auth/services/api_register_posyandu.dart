import 'package:http/http.dart' as http;
import 'package:posyandu/utils/baseurl.dart';
import 'dart:convert';

Future registerUser(
    String name,
    String phoneNumber,
    String password,
    String birthPlace,
    String birthDate,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String kelurahan,
    String puskesmas,
    String posyandu) async {
  String myUrl = MyUrl().getUrlDevice();
  String url = "$myUrl/register";
  final response = await http.post(Uri.parse(url), headers: {
    "Accept": "Application/json"
  }, body: {
    'name': name,
    'phone_number': phoneNumber,
    'password': password,
    'birthplace': birthPlace,
    'birthdate': birthDate,
    'provinsi': provinsi,
    'kabupaten': kabupaten,
    'kecamatan': kecamatan,
    'kelurahan': kelurahan,
    'puskesmas': puskesmas,
    'posyandu': posyandu
  });

  if (response.body.isNotEmpty) {
    var convertDatatoJson = jsonDecode(response.body);
    json.decode(response.body);
    return convertDatatoJson;
  }
}
