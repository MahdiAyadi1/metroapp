// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:metroapp/pages/emploi.dart';
import 'package:metroapp/pages/find_metro.dart';
import 'package:metroapp/pages/firstlogo.dart';
// import 'package:metroapp/pages/test.dart';
// import 'package:metroapp/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:metroapp/database/sqflite/home.dart';
import 'package:metroapp/pages/login.dart';
import 'package:metroapp/pages/retard.dart';
import 'package:metroapp/pages/welcome.dart';
import 'database/mysql/connexion.dart';
// import 'package:metroapp/pages/test.dart';
// import 'package:metroapp/pages/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //=================================connection MySql===================================
  // print("avant connexion");
  // final conn = await getConnection();
  // print("aprés connexion");
  //await conn.query('Insert into Student Values (1111,"kaaba")');
  // final results = await conn.query('SELECT * FROM student');
  // print("aprés result");
  // print(results);
  // for (final row in results) {
  //   print("teest");
  //   print(row.fields['name']);
  // }

  // await conn.close();

//=============================================================================================

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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Firstlogo(),
        // '/': (context) => const Home(),
        '/findmetro': (context) => const Findmetro(),
        '/login': (context) => Login(),
        '/emploi': (context) => const Emploi(),
        '/welcome': (context) => const Welcome(),
        '/retard': (context) => Retard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
