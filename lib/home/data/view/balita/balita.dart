// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/home/data/model/balita/balita_model.dart';
import 'package:posyandu/home/data/services/get_list_data_balita.dart';
import 'package:posyandu/home/data/view/balita/detail_balita.dart';
import 'package:posyandu/home/data/view/balita/input_balita.dart';
import 'package:posyandu/utils/apiservices.dart';

class Balita extends StatefulWidget {
  const Balita({Key? key}) : super(key: key);

  @override
  _BalitaState createState() => _BalitaState();
}

class _BalitaState extends State<Balita> {
  List<BalitaModel> _listbalita = [];

  // getListData() async {
  //   try {
  //     var response = await getListBalita();
  //     print(response);
  //     if (response["error"] == false) {
  //       setState(() {
  //         var data = response["data"] as List;

  //         _listbalita =
  //             data.map((e) => BalitaModel.fromMap(e)).toList().reversed.toList();
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
    ApiServices.get("babies").then((value) {
      try {
        print("response list_bayi -> $value");
        setState(() {
          var data = value["data"] as List;
          debugPrint("hasil data -> $data");
          _listbalita = data
              .map((e) => BalitaModel.fromMap(e))
              .toList()
              .reversed
              .toList();
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

  deleteDataBalita(String id) async {
    try {
      ApiServices.post("babies/$id/delete", {}).then((value) {
        Navigator.pop(context);
        print(value);
        setState(() {
          getListData();
          Fluttertoast.showToast(
              msg: 'Data berhasil dihapus',
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
    getListData();
  }

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
                  "Berikut daftar nama balita",
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: TextFormField(
                //     // readOnly: true,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.search_rounded),
                //         enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.grey),
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(16))),
                //         focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(color: Colors.grey, width: 2),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(16))),
                //         contentPadding: EdgeInsets.only(left: 20),
                //         hintText: "Cari nama",
                //         hintStyle: TextStyle(
                //             color: Colors.black45,
                //             fontSize: 14,
                //             fontFamily: 'Poppins'),
                //         filled: true,
                //         fillColor: Colors.white),
                //     style: TextStyle(
                //         color: Color(0xff3fa9a0),
                //         fontFamily: 'Poppins',
                //         fontSize: 16,
                //         fontWeight: FontWeight.w400),
                //     // maxLength: 40,
                //     // validator: validateName,
                //   ),
                // ),
                Container(
                    // color: Colors.redAccent,
                    margin: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: _listbalita.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                _listbalita.isEmpty ? 0 : _listbalita.length,
                            itemBuilder: (context, i) {
                              return Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: _buildList(
                                      _listbalita[i].name.toString(),
                                      _listbalita[i].gender.toString(),
                                      _listbalita[i].id.toString()));
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(String name, age, id) => Container(
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
                  Text(age,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      )),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailBalita(
                              name: name,
                              id: id,
                            )));
                  },
                  child: Text("Detail",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Hapus data'),
                          content: const Text('Yakin menghapus data ini?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Tidak'),
                              child: const Text('Tidak'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteDataBalita(id);
                              },
                              child: const Text('Ya'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ))
              ],
            )
          ],
        ),
      );
}
