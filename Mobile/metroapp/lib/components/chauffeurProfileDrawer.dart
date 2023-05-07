// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './myvariables.dart';

class ChauffeurProfileDrawer extends StatefulWidget {
  final Map chauffeurMap;
  const ChauffeurProfileDrawer({
    required this.chauffeurMap,
    super.key,
  });

  @override
  State<ChauffeurProfileDrawer> createState() => _ChauffeurProfileDrawerState();
}

class _ChauffeurProfileDrawerState extends State<ChauffeurProfileDrawer> {
  

  @override
  Widget build(BuildContext context) {
    // print("widget.email: ${widget.email}");
    // print("chauffeurMap : $chauffeurMap");
    return Drawer(
        child: ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: MyVariables.secondColor),
            currentAccountPicture: CircleAvatar(
              backgroundColor: MyVariables.backgroundColor,
    child: Text("${widget.chauffeurMap["name"][0]}",style: TextStyle(fontSize: 35,fontFamily: MyVariables.titleFont))
  //   Icon(
  //   Icons.person,
  //   size: 50.0, // taille de l'icône
  // ),
            ),
            accountName: Text(
              "${widget.chauffeurMap["name"]} ${widget.chauffeurMap["lastName"]}",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              // chauffeurMap["email"],
              widget.chauffeurMap["email"],
              style: TextStyle(fontSize: 18),
            )),
        Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/welcome');
            },
            child: Card(
              color: MyVariables.backgroundColor,
              child: ListTile(
                autofocus: true,
                title: Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                trailing: Icon(Icons.logout),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
