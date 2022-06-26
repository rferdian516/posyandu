// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/home/akun/model/m_user.dart';
import 'package:posyandu/home/akun/services/get_profile.dart';
import 'package:posyandu/home/data/services/get_list_data_balita.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/model/balita/balita_model.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String name = '';
  UserModel userModel = UserModel();
  int counterBalita = 0, counterLansia = 0, counterIbuhamil = 0;

  void getData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = prefs.getString("username").toString();
    });
  }

  List<BalitaModel> _listbalita = [];
  List<_BalitaData> dataBalita = [];

  List<_BalitaData> dataIbuHamil = [
    _BalitaData('Jan', 0),
    _BalitaData('Feb', 0),
    _BalitaData('Mar', 0),
    _BalitaData('Apr', 0),
    _BalitaData('Mei', 0)
  ];

  List<_BalitaData> dataLansia = [
    _BalitaData('Jan', 0),
    _BalitaData('Feb', 0),
    _BalitaData('Mar', 0),
    _BalitaData('Apr', 0),
    _BalitaData('Mei', 0)
  ];

  getUserProfile() async {
    final SharedPreferences prefs = await _prefs;
    var noHp = prefs.getString("nohp").toString();
    try {
      var rspProfile = await getProfile(noHp);
      if (rspProfile['error'] == false) {
        print(rspProfile);
        setState(() {
          userModel = UserModel.fromJson(rspProfile['data']);
        });
      }
    } catch (e) {
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

  getListData() async {
    try {
      var response = await getListBalita();
      print(response);
      if (response["error"] == false) {
        setState(() {
          var data = response["data"] as List;

          _listbalita = data
              .map((e) => BalitaModel.fromMap(e))
              .toList()
              .reversed
              .toList();

          counterBalita = _listbalita.length;
          dataBalita = [
            _BalitaData('Jan', counterBalita),
            _BalitaData('Feb', 0),
            _BalitaData('Mar', 0),
            _BalitaData('Apr', 0),
            _BalitaData('Mei', 0)
          ];
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
    getData();
    getUserProfile();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: userModel.idUser == null
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  // color: Colors.redAccent,
                  margin: EdgeInsets.all(16),
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Selamat Datang, " + name,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Posyandu ${userModel.posyandu}, Puskesmas ${userModel.puskesmas}, ${userModel.kecamatan},  ${userModel.kabupaten}",
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 32),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 24),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(counterBalita.toString(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Balita",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 24),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("0",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Ibu Hamil",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 24),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("0",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Lansia",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Statistik",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        // height: 1000,
                        child: Column(children: [
                          //Initialize the chart widget
                          SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              // title: ChartTitle(text: 'Half yearly sales analysis'),
                              // legend: Legend(isVisible: true),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries<_BalitaData, String>>[
                                ColumnSeries<_BalitaData, String>(
                                    dataSource: dataBalita,
                                    color: Colors.redAccent,
                                    xValueMapper: (_BalitaData balita, _) =>
                                        balita.year,
                                    yValueMapper: (_BalitaData balita, _) =>
                                        balita.sales,
                                    name: 'Balita',
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                ColumnSeries<_BalitaData, String>(
                                    dataSource: dataIbuHamil,
                                    color: Colors.greenAccent,
                                    xValueMapper: (_BalitaData ibuHamil, _) =>
                                        ibuHamil.year,
                                    yValueMapper: (_BalitaData ibuHamil, _) =>
                                        ibuHamil.sales,
                                    name: 'Ibu Hamil',
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                ColumnSeries<_BalitaData, String>(
                                    color: Colors.orangeAccent,
                                    dataSource: dataLansia,
                                    xValueMapper: (_BalitaData lansia, _) =>
                                        lansia.year,
                                    yValueMapper: (_BalitaData lansia, _) =>
                                        lansia.sales,
                                    name: 'Lansia',
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true))
                              ]),
                        ]),
                      )
                    ],
                  ),
                ),
              ));
  }
}

class _BalitaData {
  _BalitaData(this.year, this.sales);

  String year;
  int sales;
}
