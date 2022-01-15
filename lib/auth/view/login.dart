import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posyandu/auth/view/daftar_user.dart';
import 'package:posyandu/home/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                // controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Nomor Telepon',
                  suffixStyle: TextStyle(color: Colors.green),
                  // errorText:
                  //     _isEmailError ? "Format email tidak benar" : null,
                ),
                textInputAction: TextInputAction.next,
                inputFormatters: [LengthLimitingTextInputFormatter(40)],
                onFieldSubmitted: (value) {
                  setState(() {
                    // _isEmailError =
                    //     !(value.isNotEmpty && value.contains("@"));
                  });
                },
                onChanged: (value) {
                  setState(() {
                    // _isEmailError =
                    //     !(value.isNotEmpty && value.contains("@"));
                  });
                },
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
                  // controller: _passwordController,
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard()));
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
