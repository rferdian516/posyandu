// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/auth/view/boarding_page.dart';
import 'package:posyandu/home/akun/model/m_user.dart';
import 'package:posyandu/home/akun/services/get_profile.dart';
import 'package:posyandu/home/akun/view/ubah_password.dart';
import 'package:posyandu/home/akun/view/ubah_profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  UserModel userModel = UserModel();

  getUserProfile() async {
    final SharedPreferences prefs = await _prefs;
    var noHp = prefs.getString("nohp").toString();
    try {
      var rspProfile = await getProfile(noHp);
      if (rspProfile['error'] == false) {
        print(rspProfile);
        setState(() {
          userModel = UserModel.fromJson(rspProfile['data']);
        });
      }
    } catch (e) {
      setState(() {
        Fluttertoast.showToast(
            msg: 'Periksa jaringan internet anda',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16);
      });
    }
  }

  void logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BoardingPage()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return SafeArea(
      child: userModel.idUser == null
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Profil",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Pengaturan profil",
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffD6EEFA),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text("Informasi Umum",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.name.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TTL",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.birthPlace.toString() +
                                  ", " +
                                  DateFormat.yMMMMd('id_ID').format(
                                      DateTime.parse(
                                          userModel.birthDate.toString())),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nomor Handphone",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.phoneNumber.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text("Informasi Posyandu",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Provinsi",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.provinsi.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kab/Kota",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.kabupaten.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kecamatan",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.kecamatan.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Desa/Kelurahan",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.kelurahan.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Puskesmas",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.puskesmas.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Posyandu",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            ),
                            Text(
                              userModel.posyandu.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff696969)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => UbahPassword()));
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(vertical: 24),
                  //     padding: EdgeInsets.symmetric(horizontal: 24),
                  //     alignment: Alignment.center,
                  //     height: 50,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xffD6EEFA),
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(12),
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text("Ubah Password",
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w500)),
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //         IconButton(
                  //           icon: Icon(
                  //             Icons.navigate_next_rounded,
                  //             color: Colors.black87,
                  //           ),
                  //           onPressed: () {
                  //             // intentPusatBantuan();
                  //           },
                  //           // iconSize: 50,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text('Yakin keluar dari aplikasi?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Tidak'),
                                child: const Text('Tidak'),
                              ),
                              TextButton(
                                onPressed: () {
                                  logout();
                                },
                                child: const Text('Ya'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
