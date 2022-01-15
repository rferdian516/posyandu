// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:posyandu/home/beranda/model/m_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<_BalitaData> dataBalita = [
    _BalitaData('Jan', 35),
    _BalitaData('Feb', 28),
    _BalitaData('Mar', 34),
    _BalitaData('Apr', 32),
    _BalitaData('Mei', 40)
  ];

  List<_BalitaData> dataIbuHamil = [
    _BalitaData('Jan', 40),
    _BalitaData('Feb', 16),
    _BalitaData('Mar', 24),
    _BalitaData('Apr', 32),
    _BalitaData('Mei', 5)
  ];

  List<_BalitaData> dataLansia = [
    _BalitaData('Jan', 14),
    _BalitaData('Feb', 31),
    _BalitaData('Mar', 14),
    _BalitaData('Apr', 25),
    _BalitaData('Mei', 23)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
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
              "Selamat Datang, Dewi",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Posyandu Manggis 1, Puskesmas Pasawahan, Pesawahan Kidul, Pasawahan",
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
                        Text("4",
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
                        Text("4",
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
                        Text("12",
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
                          xValueMapper: (_BalitaData balita, _) => balita.year,
                          yValueMapper: (_BalitaData balita, _) => balita.sales,
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
                          xValueMapper: (_BalitaData lansia, _) => lansia.year,
                          yValueMapper: (_BalitaData lansia, _) => lansia.sales,
                          name: 'Lansia',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
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

  final String year;
  final double sales;
}
