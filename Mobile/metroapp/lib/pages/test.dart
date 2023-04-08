// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChauffeurListScreen extends StatefulWidget {
  const ChauffeurListScreen({super.key});

  @override
  _ChauffeurListScreenState createState() => _ChauffeurListScreenState();
}

class _ChauffeurListScreenState extends State<ChauffeurListScreen> {
  final CollectionReference chauffeurCollectionRef =
      // FirebaseFirestore.instance.collection('chauffeur');
      FirebaseFirestore.instance.collection('metro_mouvement');
  List<dynamic> chauffeurList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getChauffeurs();
  }

  Future<void> getChauffeurs() async {
    setState(() {
      isLoading = true;
    });
    final QuerySnapshot<Object?> snapshot = await chauffeurCollectionRef.get();
    final List<Map<String, dynamic>> chauffeurs = snapshot.docs
        .map<Map<String, dynamic>>((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      chauffeurList = chauffeurs;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: chauffeurList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${chauffeurList[index]['id_metro']} ${chauffeurList[index]['ligne']}',style: TextStyle(fontSize: 20)),
                  subtitle: Text('${chauffeurList[index]['location']}',style: TextStyle(fontSize: 18)),
                );
              },
            ),
    );
  }
}