// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/home/data/model/balita/balita_model.dart';
import 'package:posyandu/home/data/view/lansia/input_kes_lansia.dart';
import 'package:posyandu/home/data/view/lansia/update_kes_lansia.dart';
import 'package:posyandu/home/data/view/lansia/update_lansia.dart';

import '../../../../utils/apiservices.dart';
import '../../model/lansia/lansia_kesehatan.dart';
import '../../model/lansia/lansia_model.dart';

class DetailLansia extends StatefulWidget {
  final String name;
  final String id;
  const DetailLansia({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  _DetailLansiaState createState() => _DetailLansiaState();
}

class _DetailLansiaState extends State<DetailLansia> {
  LansiaModel dataLansia = LansiaModel();
  LansiaKesehatan dataKesehatan = LansiaKesehatan();
  String selectedBln = 'Januari';
  String bulanKesehatan = "";
  bool status = false;

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

  // getDetailData() async {
  //   try {
  //     var response = await getDetailBalita(widget.name);
  //     print(response);
  //     if (response["error"] == false) {
  //       setState(() {
  //         var data = response["data"];

  //         dataLansia = LansiaModel.fromMap(data);
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

  getDataKesehatan(String id, String bln) async {
    ApiServices.get("monthly-healt-elderlies/$id?year=2022&month=$bln")
        .then((value) {
      try {
        print("response data kesehatan -> $value");
        setState(() {
          var data = value["data"][0];
          debugPrint("hasil data -> $data");
          dataKesehatan = LansiaKesehatan.fromMap(data);
          bulanKesehatan = DateFormat.MMMM('id_ID')
                  .format(DateTime.parse(dataKesehatan.monthDate.toString())) +
              " " +
              DateFormat.y()
                  .format(DateTime.parse(dataKesehatan.monthDate.toString()));
          status = true;
        });
      } catch (e) {
        setState(() {
          status = false;
        });
        print(e);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailData(widget.id);
    getDataKesehatan(widget.id, "1");
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Lansia",
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
              dataLansia.birthDate.toString() == "null"
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
                                dataLansia.name.toString(),
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
                                "Tempat Lahir",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataLansia.birthPlace.toString(),
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
                                "Tanggal Lahir",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                DateFormat.d().format(DateTime.parse(
                                        dataLansia.birthDate.toString())) +
                                    " " +
                                    DateFormat.MMMM('id_ID').format(
                                        DateTime.parse(
                                            dataLansia.birthDate.toString())) +
                                    " " +
                                    DateFormat.y().format(DateTime.parse(
                                        dataLansia.birthDate.toString())),
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
                                "Alamat",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataLansia.address.toString(),
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
                          getDataKesehatan(widget.id,
                              (bln.indexOf(selectedBln) + 1).toString());
                          // aktifSimpan = true;
                        });
                        print(selectedBln);
                        print((bln.indexOf(selectedBln) + 1).toString());
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
                child: status == false
                    ? Center(child: Text("Tidak ada data kesehatan"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                bulanKesehatan,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateKesehatanLansia(
                                            id: dataKesehatan.id.toString(),
                                            lansiaId: dataKesehatan.elderlyId
                                                .toString(),
                                            name: dataLansia.name.toString(),
                                            selectedBulan: (bln.indexOf(
                                                                selectedBln) +
                                                            1)
                                                        .toString()
                                                        .length ==
                                                    1
                                                ? "0" +
                                                    (bln.indexOf(selectedBln) +
                                                            1)
                                                        .toString()
                                                : (bln.indexOf(selectedBln) + 1)
                                                    .toString(),
                                          )));
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
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataKesehatan.weight.toString() + " kg",
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
                                "Tinggi Badan",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataKesehatan.height.toString() + " cm",
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
                                "Lingkar perut",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
                              ),
                              Text(
                                dataKesehatan.stomachCircumference.toString() +
                                    " cm",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff696969)),
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
                        builder: (context) => InputKesehatanLansia(
                              id: widget.id,
                              name: widget.name,
                            )));
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
                        builder: (context) => UpdateLansia(
                              id: widget.id,
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
