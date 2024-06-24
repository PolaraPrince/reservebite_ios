import 'package:flutter/material.dart';
import 'package:reservebite/Pages/Onboard.dart';
import 'package:reservebite/Pages/home.dart';
import 'package:reservebite/pages/bottomnav.dart';
import 'package:reservebite/pages/login.dart';
import 'package:reservebite/pages/otp.dart';
import 'package:reservebite/pages/profile.dart';
import 'package:reservebite/pages/search.dart';
import 'package:reservebite/pages/signup.dart';
import 'package:reservebite/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ReserveBite',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
