// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:metroapp/firebase_options.dart';
import 'package:metroapp/pages/firstlogo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metroapp/pages/login.dart';
import 'package:metroapp/pages/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  

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
        '/login': (context) => Login(),
        '/welcome': (context) => const Welcome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}