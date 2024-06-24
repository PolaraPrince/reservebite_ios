import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reservebite/Pages/Onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboard()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(210, 255, 255, 255),
          child: Center(
            child: Image.asset(
              "images/logo.png",
              width: 500,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
