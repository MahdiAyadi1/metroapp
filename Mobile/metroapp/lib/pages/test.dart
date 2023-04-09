// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/components/appbar.dart';

class MetroMouvement extends StatefulWidget {
  const MetroMouvement({super.key});

  @override
  _MetroMouvementState createState() => _MetroMouvementState();
}

class _MetroMouvementState extends State<MetroMouvement> {
  final CollectionReference MetroMouvementCollectionRef =
      // FirebaseFirestore.instance.collection('chauffeur');
      FirebaseFirestore.instance.collection('metro_mouvement');
  List<dynamic> MetroMouvementList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getMetroMouvements();
  }

  Future<void> getMetroMouvements() async {
    setState(() {
      isLoading = true;
    });
    final QuerySnapshot<Object?> snapshot = await MetroMouvementCollectionRef.get();
    final List<Map<String, dynamic>> MetroMouvements = snapshot.docs
        .map<Map<String, dynamic>>((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      MetroMouvementList = MetroMouvements;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: "Metro Mouvement"),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: MetroMouvementList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${MetroMouvementList[index]['id_metro']} ${MetroMouvementList[index]['ligne']}',style: TextStyle(fontSize: 20)),
                  subtitle: Text('${MetroMouvementList[index]['location']}',style: TextStyle(fontSize: 18)),
                );
              },
            ),
    );
  }
}