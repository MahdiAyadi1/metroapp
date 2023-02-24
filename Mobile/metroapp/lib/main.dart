// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/pages/emploi.dart';
import 'package:metroapp/pages/find_metro.dart';
import 'package:metroapp/pages/firstlogo.dart';
// import 'package:metroapp/pages/test.dart';
// import 'package:metroapp/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metroapp/pages/home.dart';
import 'package:metroapp/pages/login.dart';
import 'package:metroapp/pages/welcome.dart';
// import 'package:metroapp/pages/test.dart';
// import 'package:metroapp/pages/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final Color mainColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Allfont',
        // primaryColor: Colors.indigoAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Firstlogo(),
        // '/': (context) => const Home(),
        '/findmetro': (context) => const Findmetro(),
        '/login': (context) => Login(),
        '/emploi': (context) => const Emploi(),
        '/welcome': (context) => const Welcome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
