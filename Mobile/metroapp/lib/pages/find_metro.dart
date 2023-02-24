// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';

class Findmetro extends StatelessWidget {
  const Findmetro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: MyVariables.mainColor,
        title: Text("Find metro Page",style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Myfont',
                  fontWeight: FontWeight.bold),),
        centerTitle: true,

        ),
        body: Text("Find metro Page")
      ),
    );
  }
}