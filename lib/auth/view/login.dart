// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posyandu/auth/services/api_login.dart';
import 'package:posyandu/auth/view/daftar_user.dart';
import 'package:posyandu/home/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  postLogin() async {
    final SharedPreferences prefs = await _prefs;
    // prefs.setString("username", _phoneController.text);
    // prefs.setString("password", _passwordController.text);

    var phone = _phoneController.text;
    var pass = _passwordController.text;

    if (phone == "" && pass == "") {
      setState(() {
        Fluttertoast.showToast(
            msg: 'No Hp & password tidak boleh kosong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16);
      });
    } else {
      try {
        var rspLogin = await loginUser(phone, pass);
        print(rspLogin);
        if (rspLogin['error'] == false) {
          prefs.setString("username", rspLogin['data']['name']);
          prefs.setString("nohp", rspLogin['data']['phone_number']);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Dashboard()));
          // print(prefs.getString("username"));
          Fluttertoast.showToast(
              msg: 'Login sukses',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16);
        } else {
          setState(() {
            Fluttertoast.showToast(
                msg: 'No hp atau password salah',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.orangeAccent,
                textColor: Colors.white,
                fontSize: 16);
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
  }

  @override
  Widget build(BuildContext context) {
    // bool isLogInEnabled =
    //     !_isEmailError && !_isPasswordError && _initialEnabledButton;

    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Silahkan mengisi form berikut untuk login.",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 36,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Nomor Handphone',
                  suffixStyle: TextStyle(color: Colors.green),
                  // errorText:
                  //     _isEmailError ? "Format email tidak benar" : null,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Focus(
                onFocusChange: (isFocused) {
                  setState(() {
                    // if (isFocused &&
                    //     _passwordController.text.isNotEmpty) {
                    //   _initialEnabledButton =
                    //       !_isEmailError && !_isPasswordError;
                    // }
                  });
                },
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Password',
                    suffixStyle: TextStyle(color: Colors.green),
                    // errorText: _isPasswordError
                    //     ? "Kata sandi tidak boleh kosong"
                    //     : null,
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(40),
                  ],
                  onFieldSubmitted: (value) {
                    setState(() {
                      // _isPasswordError = value.isEmpty;
                      // _initialEnabledButton =
                      //     !_isEmailError && !_isPasswordError;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      // _isPasswordError = value.isEmpty;
                      // _initialEnabledButton =
                      //     !_isEmailError && !_isPasswordError;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                alignment: Alignment.center,
                // color: Colors.amberAccent,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      "Belum mempunyai akun?",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DaftarUser()));
                      },
                      child: Text(
                        " Daftar",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff199EE6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ))),
                  onPressed: () {
                    postLogin();
                  },
                  child: Text(
                    'Login',
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
