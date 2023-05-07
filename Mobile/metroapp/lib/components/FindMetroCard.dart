// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'myvariables.dart';

class FindMetroCard extends StatelessWidget {
  final String idMetro;
  final int temps;
  final String direction;
  const FindMetroCard({
     Key? key,
    required this.idMetro,
    required this.temps,
    required this.direction
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.lerp(
          MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
      // color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),

      // shadowColor: MyVariables.mainColor,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
        title: Text(
          "Métro $idMetro",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        trailing: Text("Arrive dans $temps minutes",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            )),
        subtitle: Text(
          "Direction:             $direction",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: MyVariables.mainColor),
        ),
      ),
    );
  }
}