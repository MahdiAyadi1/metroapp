// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:metroapp/pages/test.dart';
import 'package:metroapp/pages/welcome.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Allfont',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        // '/': (context) => const Test(),
        // '/login': (context) => const Login(),
        // '/signup': (context) => const SignUp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
