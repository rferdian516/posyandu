// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/home/data/model/data_balita.dart';
import 'package:posyandu/home/data/services/get_detail_balita.dart';
import 'package:posyandu/home/data/view/balita/input_kesehatan_balita.dart';
import 'package:posyandu/home/data/view/balita/update_balita.dart';
import 'package:posyandu/home/data/view/balita/update_kesehatan_balita.dart';

class DetailBalita extends StatefulWidget {
  final String name;
  const DetailBalita({Key? key, required this.name}) : super(key: key);

  @override
  _DetailBalitaState createState() => _DetailBalitaState();
}

class _DetailBalitaState extends State<DetailBalita> {
  DataBalita dataBalita = DataBalita();
  String selectedBln = 'Januari';

  List bln = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  getDetailData() async {
    try {
      var response = await getDetailBalita(widget.name);
      print(response);
      if (response["error"] == false) {
        setState(() {
          var data = response["data"];

          dataBalita = DataBalita.fromMap(data);
        });
      }
    } catch (e) {
      print(e);
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailData();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
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
              dataBalita.birthdate.toString() == "null"
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
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
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataBalita.name.toString(),
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
                                DateFormat.d().format(DateTime.parse(
                                        dataBalita.birthdate.toString())) +
                                    " " +
                                    DateFormat.MMMM('id_ID').format(
                                        DateTime.parse(
                                            dataBalita.birthdate.toString())) +
                                    " " +
                                    DateFormat.y().format(DateTime.parse(
                                        dataBalita.birthdate.toString())),
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
                                "Jenis Kelamin",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataBalita.gender.toString() == "L"
                                    ? "Laki-laki"
                                    : "Perempuan",
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
                                "Nama Orang Tua",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataBalita.motherName.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
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
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: DropdownButton(
                    underline: SizedBox(),
                    isExpanded: true,
                    items: this
                        .bln
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ))
                        .toList(),
                    value: selectedBln,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedBln = value.toString();
                          // aktifSimpan = true;
                        });
                        print(selectedBln);
                      }
                    }),
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
                          "Januari",
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
                          "17 Kg",
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
                          "100 cm",
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
                        builder: (context) => UpdateBalita(
                              name: widget.name,
                            )));
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
