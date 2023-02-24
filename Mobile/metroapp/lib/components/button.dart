import 'package:flutter/material.dart';
import 'myvariables.dart';

class Mybutton extends StatelessWidget {
  final Text text;
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
                padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
              ),
              child: text,
            ),
          );
        
  }
}