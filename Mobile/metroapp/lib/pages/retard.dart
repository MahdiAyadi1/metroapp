// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import '../components/appbar.dart';
import '../components/myvariables.dart';

class Retard extends StatelessWidget {
  final Map chauffeurMap;
  Retard({
    required this.chauffeurMap,
    Key? key,
  }) : super(key: key);
  final objetController = TextEditingController();
  final causesDeRetardController = TextEditingController();

  final CollectionReference declarationCollection =
      FirebaseFirestore.instance.collection('declaration');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Retard"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 70),
                Text(
                "Déclaration des Retards",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MyVariables.textColor),
              ),
              SizedBox(height: 40),
                TextField(
                  controller: objetController,
                  decoration: InputDecoration(
                    labelText: "Objet",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: causesDeRetardController,
                  maxLines:
                      8, // permet à l'utilisateur de saisir plusieurs lignes
                  decoration: InputDecoration(
                    labelText: 'Ecrivez ici vos causes de retard',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 40),
                Mybutton(
                  text: "Envoyer",
                  onPressed: () async {
                    DateTime now = DateTime.now();
                    int hour = now.hour;
                    int minute = now.minute;
                    int second = now.second;
                    String date = now.toString().substring(0, 10);
                    await declarationCollection.add({
                      'title': objetController.text,
                      'description': causesDeRetardController.text,
                      'time' : "$hour:$minute:$second",
                      'date' : date,
                      'chauffeur' : "${chauffeurMap["name"]} ${chauffeurMap["lastName"]}",
                    });
                    objetController.clear();
                    causesDeRetardController.clear();
                  },

                  // Navigator.pushNamed(context, '/emploi');
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
