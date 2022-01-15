// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:posyandu/auth/view/login.dart';
import 'package:posyandu/home/dashboard.dart';
import 'package:posyandu/style/Custom.dart';

class UbahProfil extends StatefulWidget {
  const UbahProfil({Key? key}) : super(key: key);

  @override
  _UbahProfilState createState() => _UbahProfilState();
}

class _UbahProfilState extends State<UbahProfil> {
  List kotaDomisili = ["Kota Malang"];
  String selectedKotaDomisili = 'Kota Malang';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ubah Profil",
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.88,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Perbarui profil sesuai dengan data diri",
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
                  "Nama Lengkap",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                // controller: username,
                keyboardType: TextInputType.text,
                decoration: customTextField("Perbarui nama lengkap"),
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
                          "Tempat Lahir",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: DropdownButton(
                            underline: SizedBox(),
                            isExpanded: true,
                            items: this
                                .kotaDomisili
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
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
                              hintText: "12/05/1995",
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nomor Telepon",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextFormField(
                // controller: username,
                keyboardType: TextInputType.number,
                decoration: customTextField("Perbarui nomor telepon"),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard()));
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
