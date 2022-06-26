// ignore_for_file: prefer_const_constructors

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/style/Custom.dart';
import 'package:posyandu/utils/apiservices.dart';

class InputBalita extends StatefulWidget {
  const InputBalita({Key? key}) : super(key: key);

  @override
  _InputBalitaState createState() => _InputBalitaState();
}

class _InputBalitaState extends State<InputBalita> {
  List jenisKelamin = ["Laki-Laki", "Perempuan"];
  List kotaDomisili = ["Kota Malang"];
  List kecDomisili = [
    "Blimbing",
    "Kedung Kandang",
    "Klojen",
    "Lowokwaru",
    "Sukun",
  ];

  String selectedjenisKelamin = 'Laki-Laki';
  String selectedKotaDomisili = 'Kota Malang';
  String selectedKecDomisili = 'Blimbing';
  String dateSelected = '';
  String monthSelected = '';
  String yearSelected = '';
  String nowDateSelected = '';
  String nowMonthSelected = '';

  String inputJK = '';

  DateTime _fromDate = DateTime.now();
  final dateFormat = new DateFormat('dd MMMM yyyy');
  String choseDate = '';
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _anakKeController = TextEditingController();
  TextEditingController _ibuKandungController = TextEditingController();

  void getDateFromDialog() async {
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
          _tglLahirController.text =
              DateFormat.d().format(DateTime.parse(date)) +
                  " " +
                  DateFormat.MMMM('id_ID').format(DateTime.parse(date)) +
                  " " +
                  DateFormat.y().format(DateTime.parse(date));
        });
        print("tanggal yg dipilih = " + choseDate);
      }
    });
  }

  // inputDataBalita() async {
  //   var nama = _namaController.text;
  //   var anakKe = _anakKeController.text;
  //   var ibuKandung = _ibuKandungController.text;

  //   if (nama == "" && anakKe == "" && ibuKandung == "") {
  //     setState(() {
  //       Fluttertoast.showToast(
  //           msg: 'Pastikan semua form sudah terisi',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 2,
  //           backgroundColor: Colors.orangeAccent,
  //           textColor: Colors.white,
  //           fontSize: 16);
  //     });
  //   } else {
  //     try {
  //       var response =
  //           await insertBalita(nama, choseDate, "5", "68", ibuKandung, inputJK);
  //       print(response);
  //       if (response['error'] == false) {
  //         Navigator.of(context)
  //             .push(MaterialPageRoute(builder: (context) => Balita()));
  //         Fluttertoast.showToast(
  //             msg: 'Data berhasil ditambahkan',
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 2,
  //             backgroundColor: Colors.blueAccent,
  //             textColor: Colors.white,
  //             fontSize: 16);
  //       } else {
  //         setState(() {
  //           Fluttertoast.showToast(
  //               msg: 'Terjadi kesalahan',
  //               toastLength: Toast.LENGTH_SHORT,
  //               gravity: ToastGravity.BOTTOM,
  //               timeInSecForIosWeb: 2,
  //               backgroundColor: Colors.orangeAccent,
  //               textColor: Colors.white,
  //               fontSize: 16);
  //         });
  //       }
  //     } catch (e) {
  //       setState(() {
  //         Fluttertoast.showToast(
  //             msg: 'Periksa jaringan internet anda',
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 2,
  //             backgroundColor: Colors.orangeAccent,
  //             textColor: Colors.white,
  //             fontSize: 16);
  //       });
  //     }
  //   }
  // }

  inputDataBalita() async {
    try {
      ApiServices.post("babies", {
        "name": _namaController.text,
        "gender": inputJK,
        "birth_place": selectedKotaDomisili,
        "birth_date": choseDate,
        "child_order": _anakKeController.text,
        "mother_name": _ibuKandungController.text
      }).then((value) {
        Navigator.pop(context);
        print(value);
        setState(() {
          Fluttertoast.showToast(
              msg: 'Data berhasil ditambahkan',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16);
        });
      });
    } catch (e) {
      setState(() {
        Fluttertoast.showToast(
            msg: "Error $e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tambah Balita",
          style: TextStyle(
              fontSize: 24, color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
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
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nama Balita",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _namaController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama balita"),
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
                child: Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
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
                        .jenisKelamin
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
                    value: selectedjenisKelamin,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedjenisKelamin = value.toString();
                          if (value.toString() == "Laki-Laki") {
                            inputJK = "Laki-Laki";
                          } else {
                            inputJK = "Perempuan";
                          }
                        });
                        print(inputJK);
                        // print(selectedjenisKelamin);
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tempat Lahir",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
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
                child: Text(
                  "Tanggal Lahir",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  onTap: () => getDateFromDialog(),
                  controller: _tglLahirController,
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
                      hintText: "12/12/2021",
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
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Anak ke",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _anakKeController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan urutan anak  "),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 2,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nama Ibu Kandung",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _ibuKandungController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama ibu kandung"),
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
                    inputDataBalita();
                    // Navigator.pop(context);
                  },
                  child: Text(
                    'Tambah',
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
