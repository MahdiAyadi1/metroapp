// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metroapp/pages/welcome.dart';
import '../components/myvariables.dart';


class Firstlogo extends StatefulWidget {
  const Firstlogo({super.key});

  @override
  State<Firstlogo> createState() => _FirstlogoState();
}

class _FirstlogoState extends State<Firstlogo> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2), 
      () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome())); });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyVariables.backgroundColor,
      child: Image.asset('assets/images/logo-removebg-preview.png'),
    );
  }
}