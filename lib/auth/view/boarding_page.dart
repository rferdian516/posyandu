import 'package:flutter/material.dart';
import 'package:posyandu/auth/view/daftar_user.dart';
import 'package:posyandu/auth/view/login.dart';
import 'package:posyandu/home/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String name = '';
  checkUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = prefs.getString("username").toString();
    });

    if (name != "null") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: Image.asset("assets/images/img_itn.png"),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Selamat Datang di Pelaporan Posyandu",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Anda dapat melihat tumbuh kembang bayi, Ibu hamil, dan Lansia.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1.0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Color(0xff199EE6), width: 1.5)))),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
                // isLogInEnabled
                //     ? () {
                //         postLogin();
                //       }
                //     : null,

                child: Text(
                  'Masuk',
                  style: TextStyle(
                      color: Color(0xff199EE6),
                      fontFamily: 'Rubik',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(1.0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff199EE6)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ))),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DaftarUser()));
                },
                child: Text(
                  'Daftar',
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
    );
  }
}
