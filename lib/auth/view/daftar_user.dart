// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:date_time_format/src/date_time_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/auth/services/api_register_posyandu.dart';
import 'package:posyandu/auth/view/login.dart';
import 'package:posyandu/home/dashboard.dart';
import 'package:posyandu/style/Custom.dart';
import 'package:intl/intl.dart';

class DaftarUser extends StatefulWidget {
  const DaftarUser({Key? key}) : super(key: key);

  @override
  _DaftarUserState createState() => _DaftarUserState();
}

class _DaftarUserState extends State<DaftarUser> {
  List provDomisili = ["Jawa Timur"];
  List kotaDomisili = ["Kota Malang"];
  List kecDomisili = [
    "Blimbing",
    "Kedung Kandang",
    "Klojen",
    "Lowokwaru",
    "Sukun",
  ];

  String dateSelected = '';
  String monthSelected = '';
  String yearSelected = '';
  String nowDateSelected = '';
  String nowMonthSelected = '';
  DateTime _fromDate = DateTime.now();
  final dateFormat = new DateFormat('dd MMMM yyyy');
  String choseDate = '';

  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController dataAwalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController kelurahanController = TextEditingController();
  TextEditingController puskesmasController = TextEditingController();
  TextEditingController posyanduController = TextEditingController();

  void getDateFromDialog(String data) async {
    // final prefs = await _prefs;
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        DateTime _fromDate = DateTime.now();
        final dateFormat = new DateFormat('dd MMMM yyyy');
        final monthFormat = new DateFormat('MMMM yyyy');
        _fromDate = value;
        final String date = _fromDate.format("Y-m-d");

        final String month = monthFormat.format(_fromDate);

        // String date = _fromDate.format("Y-m-d");
        setState(() {
          dateSelected = dateFormat.format(DateTime.parse(date));
          monthSelected = month;
          choseDate = date;
          if (data == "awal") {
            dataAwalController.text = dateSelected;
          } else {
            // dataAkhirController.text = dateSelected;
          }
          // getListDaily(date);
        });
        print("tanggal yg dipilih = " + dateSelected);
      }
    });
  }

  postRegister() async {
    var namaLengkap = namaLengkapController.text;
    var noHp = noHpController.text;
    var pass = passwordController.text;
    var tempatLahir = tempatLahirController.text;
    var tanggalLahir = choseDate.toString();
    var provinsi = selectedProvDomisili;
    var kabupaten = selectedKotaDomisili;
    var kecamatan = selectedKecDomisili;
    var kelurahan = kelurahanController.text;
    var puskesmas = puskesmasController.text;
    var posyandu = posyanduController.text;

    if (namaLengkap != "" && posyandu != "") {
      try {
        var rspRegis = await registerUser(
            namaLengkap,
            noHp,
            pass,
            tempatLahir,
            tanggalLahir,
            provinsi,
            kabupaten,
            kecamatan,
            kelurahan,
            puskesmas,
            posyandu);
        print(rspRegis);
        if (rspRegis['error'] == false) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
          Fluttertoast.showToast(
              msg: 'Berhasil mendaftarkan akun',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16);
        }
      } catch (e) {
        setState(() {
          Fluttertoast.showToast(
              msg: 'Terjadi kesalahan, silahkan coba kembali',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16);
        });
      }
    } else {
      setState(() {
        Fluttertoast.showToast(
            msg: 'Pastikan semua form terisi',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16);
      });
    }
  }

  String selectedProvDomisili = 'Jawa Timur';
  String selectedKotaDomisili = 'Kota Malang';
  String selectedKecDomisili = 'Blimbing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Daftar Pengguna",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Silahkan memilih sesuai dengan Posyandu anda.",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Nama Lengkap",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: namaLengkapController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama lengkap"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 40,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "No Hp",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: noHpController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan nomor hp"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 13,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: customTextField("Masukan password"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 8,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Tempat Lahir",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: tempatLahirController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan tempat lahir"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 40,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Tanggal Lahir",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: MediaQuery.of(context).size.width,
                // height: 30,
                // color: Colors.redAccent,
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      getDateFromDialog("awal");
                    });
                  },
                  controller: dataAwalController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_outlined,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "1 Januari 2022",
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
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Poysandu Terdaftar",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Provinsi",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
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
                        .provDomisili
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
                    value: selectedProvDomisili,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedProvDomisili = value.toString();
                          // aktifSimpan = true;
                        });
                        print(selectedKotaDomisili);
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Kabupaten/Kota",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
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
                        .kotaDomisili
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
                    value: selectedKotaDomisili,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedKotaDomisili = value.toString();
                          // aktifSimpan = true;
                        });
                        print(selectedKotaDomisili);
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Kecamatan",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
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
                        .kecDomisili
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
                    value: selectedKecDomisili,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedKecDomisili = value.toString();
                          // aktifSimpan = true;
                        });
                        print(selectedKecDomisili);
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Desa/Kelurahan",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: kelurahanController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan Nama Desa/Kelurahan"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 40,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Puskesmas",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: puskesmasController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama puskesmas"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 40,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Posyandu",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " *",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: posyanduController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama posyandu"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 40,
                // validator: validateName,
              ),
              Container(
                width: 250,
                alignment: Alignment.center,
                // color: Colors.amberAccent,
                child: Row(
                  children: [
                    Text(
                      "Sudah mempunyai akun?",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff199EE6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ))),
                  onPressed: () {
                    postRegister();
                  },
                  child: Text(
                    'Daftar',
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
        ),
      ),
    );
  }
}
