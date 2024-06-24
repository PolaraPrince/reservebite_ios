import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'sf-pro');
  }

  static TextStyle headlineTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'sf-pro');
  }

  static TextStyle lightTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'sf-pro');
  }

  static TextStyle semiBoldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'sf-pro');
  }

  static TextStyle smallBoldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'sf-pro');
  }
}
