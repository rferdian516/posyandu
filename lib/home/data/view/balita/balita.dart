// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:posyandu/home/data/view/balita/detail_balita.dart';
import 'package:posyandu/home/data/view/balita/input_balita.dart';

class Balita extends StatefulWidget {
  const Balita({Key? key}) : super(key: key);

  @override
  _BalitaState createState() => _BalitaState();
}

class _BalitaState extends State<Balita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Balita",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InputBalita()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Silahkan cari pada daftar nama balita",
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
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    // readOnly: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: "Cari nama",
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
                  // color: Colors.redAccent,
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Felyn Widyaningrum", "26")),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Dewi Nur Azizah", "35")),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Sinta Nanda Novita", "24")),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Siti Marsuah", "36")),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Sri Sulastri", "38")),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: _buildList("Indah Safitri", "28"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(String name, age) => InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailBalita()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.center,
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xffD6EEFA),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 8,
                    ),
                    Text("$age bulan",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        )),
                  ],
                ),
              ),
              Text("Detail",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      );
}
