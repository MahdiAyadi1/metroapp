// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'myvariables.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final icon;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return (Container(
    //  margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: MyVariables.backgroundColor,
        borderRadius: BorderRadius.circular(66),
      ),
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 16), 
      child: TextField(
        style: TextStyle(fontSize: 19),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)
        ),
      ),
    ));
  }
}
