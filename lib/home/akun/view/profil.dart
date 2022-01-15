// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:posyandu/home/akun/view/ubah_password.dart';
import 'package:posyandu/home/akun/view/ubah_profil.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Dewi Ratnasari",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Probolinggo, 12 Mei 1995",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "087687658765",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Jawa Timur",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Kota Malang",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Blimbing",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Blimbing",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Blimbing 1",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      ),
                      Text(
                        "Manggis",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff696969)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UbahPassword()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffD6EEFA),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ubah Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 8,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next_rounded,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        // intentPusatBantuan();
                      },
                      // iconSize: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ))),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UbahProfil()));
                },
                child: Text(
                  'Perbarui',
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
