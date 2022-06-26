// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/home/data/model/ibuhamil/ibu_kesehatan.dart';

import '../../../../style/Custom.dart';
import '../../../../utils/apiservices.dart';
import '../../model/balita/balita_kesehatan.dart';

class UpdateKesehatanIbuHamil extends StatefulWidget {
  final String id;
  final String womenId;
  final String name;
  final String selectedBulan;
  const UpdateKesehatanIbuHamil(
      {Key? key,
      required this.id,
      required this.womenId,
      required this.name,
      required this.selectedBulan})
      : super(key: key);

  @override
  State<UpdateKesehatanIbuHamil> createState() =>
      _UpdateKesehatanIbuHamilState();
}

class _UpdateKesehatanIbuHamilState extends State<UpdateKesehatanIbuHamil> {
  IbuKesehatan dataKesehatan = IbuKesehatan();

  TextEditingController namaController = TextEditingController();
  TextEditingController bbController = TextEditingController();
  TextEditingController tbController = TextEditingController();
  TextEditingController lkController = TextEditingController();
  TextEditingController lpController = TextEditingController();
  TextEditingController usiaController = TextEditingController();

  List jenisKelamin = ["Laki-Laki", "Perempuan"];
  List kotaDomisili = ["Kota Malang"];
  List kecDomisili = [
    "Blimbing",
    "Kedung Kandang",
    "Klojen",
    "Lowokwaru",
    "Sukun",
  ];
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

  String selectedjenisKelamin = 'Laki-Laki';
  String selectedKotaDomisili = 'Kota Malang';
  String selectedKecDomisili = 'Blimbing';
  String selectedBln = 'Januari';

  inputDataKesehatan() async {
    try {
      ApiServices.post("monthly-healt-pregnant-womens/${widget.id}/update", {
        "baby_id": widget.womenId,
        "height": tbController.text,
        "weight": bbController.text,
        "stomach_circumference": lpController.text,
        "month_date": "2022-${widget.selectedBulan}-01"
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

  getDataKesehatan(String id, String bln) async {
    ApiServices.get(
            "monthly-healt-pregnant-womens/${widget.womenId}?year=2022&month=${widget.selectedBulan}")
        .then((value) {
      try {
        print("response detail kesehatan -> $value");
        setState(() {
          var data = value["data"][0];
          debugPrint("hasil data -> $data");
          dataKesehatan = IbuKesehatan.fromMap(data);
          bbController.text = dataKesehatan.weight.toString();
          tbController.text = dataKesehatan.height.toString();
          lpController.text = dataKesehatan.stomachCircumference.toString();
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController.text = widget.name;
    getDataKesehatan(widget.womenId, widget.selectedBulan);
    print("${widget.womenId}, ${widget.selectedBulan}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Perbarui Data Kesehatan",
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
                readOnly: true,
                controller: namaController,
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
                  "Data Bulan",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Text(
                  bln[int.parse(widget.selectedBulan) - 1],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
                // DropdownButton(
                //     underline: SizedBox(),
                //     isExpanded: true,
                //     items: this
                //         .bln
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: Container(
                //                   margin:
                //                       const EdgeInsets.only(left: 8, right: 8),
                //                   child: Text(
                //                     item,
                //                     style: TextStyle(
                //                         fontSize: 15,
                //                         fontFamily: 'Poppins',
                //                         color: Colors.black54,
                //                         fontWeight: FontWeight.w600),
                //                   )),
                //             ))
                //         .toList(),
                //     value: selectedBln,
                //     onChanged: (value) {}),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Berat Badan",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: bbController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan berat badan"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 5,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tinggi Badan",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: tbController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan tinggi badan"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 5,
                // validator: validateName,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lingkar Perut",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                controller: lpController,
                keyboardType: TextInputType.number,
                decoration: customTextField("Masukan lingkar perut"),
                // onChanged: (value) async {
                //   final prefs = await _prefs;
                //   prefs.setString("userName", value);
                // },
                style: TextStyle(
                    color: Color(0xff3fa9a0),
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                maxLength: 5,
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
                    inputDataKesehatan();
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
