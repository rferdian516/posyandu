// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:posyandu/home/akun/view/ubah_password.dart';
import 'package:posyandu/home/data/view/balita/balita.dart';

import 'ibuhamil/ibuhamil.dart';
import 'lansia/lansia.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  intentDataBalita() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Balita()));
  }

  intentIbuHamil() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => IbuHamil()));
  }

  intentDataLansia() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Lansia()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(24, 26, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Data",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Silahkan pilih untuk melihat daftar data",
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                intentDataBalita();
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
                    Text("Bayi & Balita",
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
                        intentDataBalita();
                      },
                      // iconSize: 50,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                intentIbuHamil();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
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
                    Text("Ibu Hamil",
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
                        intentIbuHamil();
                      },
                      // iconSize: 50,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                intentDataLansia();
              },
              child: Container(
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
                    Text("Lansia",
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
                        intentDataLansia();
                      },
                      // iconSize: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
