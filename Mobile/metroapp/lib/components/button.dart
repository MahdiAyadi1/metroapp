// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'myvariables.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Mybutton({super.key,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 68),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyVariables.mainColor),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(60,25,60,25)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
              ),
              child: Text(
                    text,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
            ),
          );
        
  }
}