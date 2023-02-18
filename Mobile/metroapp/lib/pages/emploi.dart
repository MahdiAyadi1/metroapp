// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Emploi extends StatelessWidget {
  const Emploi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Emploi Page",style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Myfont',
                  fontWeight: FontWeight.bold),),
        centerTitle: true,

        ),
        body: Text("Emploi Page")
      ),
    );
  }
}