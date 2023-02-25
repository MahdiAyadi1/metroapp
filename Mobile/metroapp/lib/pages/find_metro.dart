// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';

import '../components/appbar.dart';

class Findmetro extends StatelessWidget {
  const Findmetro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Find metro Page"),
        body: Text("Find metro Page")
      ),
    );
  }
}