// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/components/appbar.dart';

import '../components/chauffeurProfileDrawer.dart';
import '../components/myvariables.dart';

class Emploi extends StatefulWidget {
  final String? CIN;
  const Emploi({
    required this.CIN,
    Key? key,
  }) : super(key: key);

  @override
  _EmploiState createState() => _EmploiState();
}

class _EmploiState extends State<Emploi> {
  final CollectionReference ChauffeurCollectionRef =
      // FirebaseFirestore.instance.collection('chauffeur');
      FirebaseFirestore.instance.collection('chauffeur');
  List EventsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  Future<void> getEvents() async {
    // setState(() {
    //   isLoading = true;
    // });
    final QuerySnapshot<Object?> snapshot = await ChauffeurCollectionRef.get();
    final List<Map<String, dynamic>> Chauffeurs = snapshot.docs
        .map<Map<String, dynamic>>((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      (Chauffeurs.where((chauffeur) => chauffeur["cin"] == widget.CIN).toList())[0]["json"] != null ?
      EventsList = (Chauffeurs.where((chauffeur) => chauffeur["cin"] == widget.CIN).toList())[0]["json"] : 
      EventsList = [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(EventsList);
    return Scaffold(
      endDrawer: ChauffeurProfileDrawer(),
          appBar: MyAppBar(text: "Emploi Page"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/test');
            },
            child: Icon(Icons.notification_important),
            backgroundColor: MyVariables.mainColor,
          ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Table(
            border: TableBorder.all(),
            // ignore: prefer_const_literals_to_create_immutables
            columnWidths: {
              0: FixedColumnWidth(137.5),
              1: FixedColumnWidth(137.5),
              2: FixedColumnWidth(137.5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text('Metro',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23.0)),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text('Ligne',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23.0)),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text('Horaire',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23.0)),
                    ),
                  ),
                ],
              ),
              
              for (Map event in EventsList)
                TableRow(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(event["metro"],
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(event["line"],
                              style: TextStyle(fontSize: 20.0))),
                    ),
                    TableCell(
                      child: Center(
                          child: Text("${event["startTime"]} - ${event["endTime"]}",
                              style: TextStyle(fontSize: 20.0))),
                    ),
                  ],
                ),
            ],
          )
    );
  }
}
