// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/home/dashboard.dart';
import 'package:posyandu/style/Custom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_time_format/src/date_time_extension_methods.dart';

class Export extends StatefulWidget {
  const Export({Key? key}) : super(key: key);

  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  List kotaDomisili = ["Bayi dan Balita", "Ibu Hamil", "Lansia"];
  String selectedKotaDomisili = "Bayi dan Balita";
  String chooseExport = "Bayi dan Balita";
  String dateSelected = '';
  String monthSelected = '';
  String yearSelected = '';
  String nowDateSelected = '';
  String nowMonthSelected = '';
  DateTime _fromDate = DateTime.now();
  final dateFormat = new DateFormat('dd MMMM yyyy');
  String choseDate = '';
  TextEditingController dataAwalController = TextEditingController();
  TextEditingController dataAkhirController = TextEditingController();

  void _downloadPdf(String idExport) async {
    String url = "https://rumahrahileducation.com/api/posyandu?id=$idExport";
    if (!await launch(url)) throw 'Could not open $url';
    print("https://rumahrahileducation.com/api/posyandu?id=$idExport");
  }

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
            dataAkhirController.text = dateSelected;
          }
          // getListDaily(date);
        });
        print("tanggal yg dipilih = " + dateSelected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Export Data",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Pilih jenis data dan bulan atau tahun ",
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
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pilih Jenis Data",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
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
                          chooseExport = value.toString();
                        });
                        print(selectedKotaDomisili);
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Data Awal",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Data Akhir",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        // height: 30,
                        // color: Colors.redAccent,
                        child: TextFormField(
                          onTap: () {
                            setState(() {
                              getDateFromDialog("akhir");
                            });
                          },
                          controller: dataAkhirController,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_outlined,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "31 Januari 2022",
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
                    ],
                  ),
                ],
              ),
              Spacer(),
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
                    if (chooseExport == "Bayi dan Balita") {
                      _downloadPdf("1");
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Simpan laporan Bayi dan Balita",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 16);
                      });
                    } else if (chooseExport == "Ibu Hamil") {
                      _downloadPdf("2");
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Simpan laporan Ibu Hamil",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 16);
                      });
                    } else if (chooseExport == "Lansia") {
                      _downloadPdf("2");
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Simpan laporan Lansia",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 16);
                      });
                    }
                    // _downloadPdf();
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  child: Text(
                    'Export',
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
