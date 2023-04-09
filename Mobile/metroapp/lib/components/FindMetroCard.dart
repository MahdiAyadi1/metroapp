// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'myvariables.dart';

class FindMetroCard extends StatelessWidget {
  final String idMetro;
  final int temps;
  final String location;
  const FindMetroCard({
     Key? key,
    required this.idMetro,
    required this.temps,
    required this.location
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
          "Metro $idMetro",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Text("Arrive dans $temps minutes",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            )),
        // subtitle: Text(
        //   "Dans $location",
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        // ),
      ),
    );
  }
}