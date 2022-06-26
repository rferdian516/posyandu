// ignore_for_file: prefer_const_constructors

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../style/Custom.dart';
import '../../../../utils/apiservices.dart';
import '../../model/balita/balita_model.dart';
import '../../model/lansia/lansia_model.dart';

class UpdateLansia extends StatefulWidget {
  final String id;
  final String name;
  const UpdateLansia({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<UpdateLansia> createState() => Update_LansiaState();
}

class Update_LansiaState extends State<UpdateLansia> {
  LansiaModel dataLansia = LansiaModel();
  List jenisKelamin = ["-", "Laki-Laki", "Perempuan"];
  List kotaDomisili = ["Kota Malang"];

  String selectedjenisKelamin = '-';
  String selectedKotaDomisili = 'Kota Malang';
  String dateSelected = '';
  String monthSelected = '';
  String yearSelected = '';
  String nowDateSelected = '';
  String nowMonthSelected = '';
  String inputJK = "";
  DateTime _fromDate = DateTime.now();
  final dateFormat = new DateFormat('dd MMMM yyyy');
  String choseDate = '';

  TextEditingController _namaController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _usiaController = TextEditingController();
  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _penyakitController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
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
        print("tanggal yg dipilih = " + dateSelected);
      }
    });
  }

  // getDetailData() async {
  //   try {
  //     var response = await getDetailBalita(widget.name);
  //     print(response);
  //     if (response["error"] == false) {
  //       setState(() {
  //         var data = response["data"];

  //         dataBalita = BalitaModel.fromMap(data);
  //         _namaController.text = dataBalita.name.toString();
  //         _tglLahirController.text = DateFormat.d()
  //                 .format(DateTime.parse(dataBalita.birthDate.toString())) +
  //             " " +
  //             DateFormat.MMMM('id_ID')
  //                 .format(DateTime.parse(dataBalita.birthDate.toString())) +
  //             " " +
  //             DateFormat.y()
  //                 .format(DateTime.parse(dataBalita.birthDate.toString()));
  //         _ibuKandungController.text = dataBalita.motherName.toString();
  //         selectedjenisKelamin =
  //             dataBalita.gender.toString() == "L" ? "Laki-Laki" : "Perempuan";
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       Fluttertoast.showToast(
  //           msg: 'Periksa jaringan internet anda',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 2,
  //           backgroundColor: Colors.orangeAccent,
  //           textColor: Colors.white,
  //           fontSize: 16);
  //     });
  //   }
  // }

  getDetailData(String id) async {
    ApiServices.get("elderlies/$id").then((value) {
      try {
        print("response detail lansia -> $value");
        setState(() {
          var data = value["data"];
          debugPrint("hasil data -> $data");
          dataLansia = LansiaModel.fromMap(data);
          _namaController.text = dataLansia.name.toString();
          _tempatLahirController.text = dataLansia.birthPlace.toString();
          _tglLahirController.text = DateFormat.d()
                  .format(DateTime.parse(dataLansia.birthDate.toString())) +
              " " +
              DateFormat.MMMM('id_ID')
                  .format(DateTime.parse(dataLansia.birthDate.toString())) +
              " " +
              DateFormat.y()
                  .format(DateTime.parse(dataLansia.birthDate.toString()));
          _usiaController.text = dataLansia.age.toString();
          _alamatController.text = dataLansia.address.toString();
          _penyakitController.text = dataLansia.diseaseHistory.toString();
        });
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: 'Gagal memuat data',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16);
      }
    });
  }

  updatedataLansia(String id) async {
    try {
      ApiServices.post("elderlies/$id", {
        "name": _namaController.text,
        "age": _usiaController.text,
        "address": _alamatController.text,
        "disease_history": _penyakitController.text,
        "birth_place": _tempatLahirController.text,
        "birth_date":
            choseDate == "" ? dataLansia.birthDate.toString() : choseDate
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tambah Lansia",
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
                  "Nama Lansia",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _namaController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama lansia"),
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

              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 16),
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Tempat Lahir",
              //     style: TextStyle(
              //         fontSize: 16,
              //         color: Colors.black87,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: EdgeInsets.symmetric(horizontal: 8),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(color: Colors.grey),
              //       borderRadius: BorderRadius.all(Radius.circular(16))),
              //   child: DropdownButton(
              //       underline: SizedBox(),
              //       isExpanded: true,
              //       items: this
              //           .kotaDomisili
              //           .map((item) => DropdownMenuItem<String>(
              //                 value: item,
              //                 child: Container(
              //                     margin:
              //                         const EdgeInsets.only(left: 8, right: 8),
              //                     child: Text(
              //                       item,
              //                       style: TextStyle(
              //                           fontSize: 15,
              //                           fontFamily: 'Poppins',
              //                           color: Colors.black54,
              //                           fontWeight: FontWeight.w600),
              //                     )),
              //               ))
              //           .toList(),
              //       value: selectedKotaDomisili,
              //       onChanged: (value) {
              //         if (value != null) {
              //           setState(() {
              //             selectedKotaDomisili = value.toString();
              //             // aktifSimpan = true;
              //           });
              //           print(selectedKotaDomisili);
              //         }
              //       }),
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tempat Lahir",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _tempatLahirController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan nama kota"),
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
                  "Usia",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _usiaController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan usia"),
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
                  "Alamat",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _alamatController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan alamat"),
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
                  "Riwayat Penyakit (beri \- bila kosong)",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: _penyakitController,
                keyboardType: TextInputType.text,
                decoration: customTextField("Masukan riwayat penyakit"),
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
                    updatedataLansia(widget.id);
                    // Navigator.pop(context);
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
        ),
      ),
    );
  }
}
