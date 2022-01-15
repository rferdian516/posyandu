// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:posyandu/home/data/view/balita/input_kesehatan_balita.dart';
import 'package:posyandu/home/data/view/balita/update_balita.dart';
import 'package:posyandu/home/data/view/balita/update_kesehatan_balita.dart';

class DetailBalita extends StatefulWidget {
  const DetailBalita({Key? key}) : super(key: key);

  @override
  _DetailBalitaState createState() => _DetailBalitaState();
}

class _DetailBalitaState extends State<DetailBalita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Balita",
          style: TextStyle(
              fontSize: 24, color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Color(0xff199EE6),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                // height: 280,
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
                          "Probolinggo, 12 Desember 2021",
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
                          "Jenis Kelamin",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        ),
                        Text(
                          "Perempuan",
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
                          "Nama Orang Tua",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        ),
                        Text(
                          "Felyn Widyaningrum",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pendataan kesehatan",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Pilih bulan",
                      hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontFamily: 'Poppins'),
                      filled: true,
                      fillColor: Colors.white),
                  style: TextStyle(
                      color: Color(0xff3fa9a0),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  // maxLength: 40,
                  // validator: validateName,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(16),
                // height: 280,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "September",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateKesehatanBalita()));
                          },
                          child: Text(
                            "✎ Perbarui",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   "September",
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.black87,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Berat Badan",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        ),
                        Text(
                          "2.8 Kg",
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
                          "Tinggi Badan",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        ),
                        Text(
                          "50 cm",
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
                          "Riwayat Penyakit",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        ),
                        Text(
                          "Tidak ada",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff696969)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputKesehatanBalita()));
                  },
                  child: Text(
                    'Tambah Data Kesehatan',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateBalita()));
                  },
                  child: Text(
                    'Perbarui Informasi Umum',
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
      ),
    );
  }
}
