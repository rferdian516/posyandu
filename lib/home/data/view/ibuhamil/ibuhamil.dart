// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/home/data/view/ibuhamil/detail_ibuhamil.dart';
import 'package:posyandu/home/data/view/ibuhamil/input_ibuhamil.dart';

import '../../../../utils/apiservices.dart';
import '../../model/balita/balita_model.dart';
import '../../model/ibuhamil/ibu_model.dart';
import '../balita/detail_balita.dart';
import '../balita/input_balita.dart';

class IbuHamil extends StatefulWidget {
  const IbuHamil({Key? key}) : super(key: key);

  @override
  State<IbuHamil> createState() => _IbuHamilState();
}

class _IbuHamilState extends State<IbuHamil> {
  List<IbuModel> _listIbu = [];

  // getListData() async {
  //   try {
  //     var response = await getListBalita();
  //     print(response);
  //     if (response["error"] == false) {
  //       setState(() {
  //         var data = response["data"] as List;

  //         _listIbu =
  //             data.map((e) => IbuModel.fromMap(e)).toList().reversed.toList();
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

  getListData() async {
    ApiServices.get("pregnant-womens").then((value) {
      try {
        print("response list_ibu -> $value");
        setState(() {
          var data = value["data"] as List;
          debugPrint("hasil data -> $data");
          _listIbu =
              data.map((e) => IbuModel.fromMap(e)).toList().reversed.toList();
        });
      } catch (e) {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Ibu Hamil",
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InputIbuHamil()));
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
                  "Silahkan cari pada daftar nama Ibu hamil",
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
                    child: _listIbu.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: _listIbu.isEmpty ? 0 : _listIbu.length,
                            itemBuilder: (context, i) {
                              return Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: _buildList(
                                      _listIbu[i].name.toString(),
                                      _listIbu[i].age.toString(),
                                      _listIbu[i].id.toString()));
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(String name, age, id) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailIbuHamil(
                    name: name,
                    id: id,
                  )));
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
                    Text(age + " th",
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
