import 'dart:ui';
import 'package:flutter/material.dart';

InputDecoration customTextField(String hint) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      contentPadding: EdgeInsets.only(left: 20),
      hintText: hint,
      hintStyle:
          TextStyle(color: Colors.black45, fontSize: 14, fontFamily: 'Poppins'),
      filled: true,
      fillColor: Colors.white);
}
