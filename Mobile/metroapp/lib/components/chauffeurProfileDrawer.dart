// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './myvariables.dart';

class ChauffeurProfileDrawer extends StatefulWidget {
  final String email;
  const ChauffeurProfileDrawer({
    required this.email,
    super.key,
  });

  @override
  State<ChauffeurProfileDrawer> createState() => _ChauffeurProfileDrawerState();
}

class _ChauffeurProfileDrawerState extends State<ChauffeurProfileDrawer> {
  Map chauffeurMap = {};
  final CollectionReference chauffeurCollectionRef =
      // FirebaseFirestore.instance.collection('chauffeur');
      FirebaseFirestore.instance.collection('chauffeur');
  @override
  void initState() {
    super.initState();
    getChauffeur();
  }

  Future<void> getChauffeur() async {
    final QuerySnapshot<Object?> snapshot =
        await chauffeurCollectionRef.where('email', isEqualTo: widget.email).get();
    final List<Map<String, dynamic>> chauffeurs = snapshot.docs
        .map<Map<String, dynamic>>(
            (doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      chauffeurMap = chauffeurs[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("widget.email: ${widget.email}");
    print("chauffeurMap : $chauffeurMap");
    return Drawer(
        child: ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: MyVariables.secondColor),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            accountName: Text(
              "${chauffeurMap["name"]} ${chauffeurMap["lastName"]}",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              // chauffeurMap["email"],
              widget.email,
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
