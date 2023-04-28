// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/components/appbar.dart';
import 'package:metroapp/pages/retard.dart';

import '../components/chauffeurProfileDrawer.dart';
import '../components/myvariables.dart';

class Emploi extends StatefulWidget {
  final String email;
  const Emploi({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  _EmploiState createState() => _EmploiState();
}

class _EmploiState extends State<Emploi> {
  final CollectionReference chauffeurCollectionRef =
      // FirebaseFirestore.instance.collection('chauffeur');
      FirebaseFirestore.instance.collection('chauffeur');
  List EventsList = [];
  Map chauffeurMap = {};
  bool isLoading = true;
  List<List> days = List.generate(7, (_) => []);
  @override
  void initState() {
    super.initState();
    getEvents();
    getChauffeur();
  }

  Future<void> getEvents() async {
    // setState(() {
    //   isLoading = true;
    // });
    final QuerySnapshot<Object?> snapshot = await chauffeurCollectionRef.get();
    final List<Map<String, dynamic>> Chauffeurs = snapshot.docs
        .map<Map<String, dynamic>>(
            (doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      (Chauffeurs.where((chauffeur) => chauffeur["email"] == widget.email)
                  .toList())[0]["json"] !=
              null
          ? EventsList = (Chauffeurs.where(
                  (chauffeur) => chauffeur["email"] == widget.email)
              .toList())[0]["json"]
          : EventsList = [];
      isLoading = false;
    });
  }

  Future<void> getChauffeur() async {
    final QuerySnapshot<Object?> snapshot = await chauffeurCollectionRef
        .where('email', isEqualTo: widget.email)
        .get();
    final List<Map<String, dynamic>> chauffeurs = snapshot.docs
        .map<Map<String, dynamic>>(
            (doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      chauffeurMap = chauffeurs[0];
    });
  }

  String Convert(int event) {
    String result = "";
    switch (event) {
      case 0:
        result = "Dimanche";
        break;
      case 1:
        result = "Lundi";
        break;
      case 2:
        result = "Mardi";
        break;
      case 3:
        result = "Mercredi";
        break;
      case 4:
        result = "Jeudi";
        break;
      case 5:
        result = "Vendredi";
        break;
      case 6:
        result = "Samedi";
        break;
    }
    return result;
  }

  void getEventsByDay(EventsList){
    for (var event in EventsList) {
      (days[int.parse(event["daysOfWeek"])]).add(event);
    }

  }
  void TrierByStartTime(List<List> days){
for (var i = 0; i < days.length; i++) {
    days[i].sort((a, b) => a['startTime'].compareTo(b['startTime']));
    days[i] = List.from(days[i]); // réinitialise la liste triée
  }
  }

  @override
  Widget build(BuildContext context) {
    print(chauffeurMap);
    // print("EventsList=$EventsList");
    // print(widget.email);

    //Mettre les events dans une List<List> nommé days pour séparer les jours oû days[0] par exemple comporte les events de dimanche
    getEventsByDay(EventsList);
    //trier les events de chaque jours(càd de chaque days[i]) par rapport à startTime
    TrierByStartTime(days);
    // print("days=$days");
    return Scaffold(
        endDrawer: ChauffeurProfileDrawer(chauffeurMap: chauffeurMap),
        appBar: MyAppBar(text: "Emploi Page"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Retard(chauffeurMap: chauffeurMap);
      }));
          },
          backgroundColor: MyVariables.mainColor,
          child: Icon(Icons.notification_important),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(3.0),
                child: ListView(
                  children: [
                    // for(int i =0;i<2;i++){
                    for (int eventDay = 0; eventDay < days.length; eventDay++)
                    if(days[eventDay].isNotEmpty)
                      Column(
                        children: [
                          Text(
                            Convert(eventDay),
                            style: TextStyle(
                                color: MyVariables.secondColor,
                                fontSize: 33,
                                fontWeight: FontWeight.bold),
                          ),
                          Table(
                            border: TableBorder.all(),
                            // columnWidths: {
                            //   0: FixedColumnWidth(120),
                            //   1: FixedColumnWidth(120),
                            //   2: FixedColumnWidth(138),
                            // },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
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
                                      child: Text('Metro',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  TableCell(
                                      child: Text('Ligne',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23.0),
                                          textAlign: TextAlign.center)),
                                  TableCell(
                                    child: Text('Horaire',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23.0),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                              for (Map event in days[eventDay])
                                TableRow(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    TableCell(
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(event["metro"],
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20.0),
                                              textAlign: TextAlign.center)),
                                    ),
                                    TableCell(
                                        child: Text(event["line"],
                                            style: TextStyle(fontSize: 20.0),
                                            textAlign: TextAlign.center)),
                                    TableCell(
                                        child: Text(
                                            "${event["startTime"]} - ${event["endTime"]}",
                                            style: TextStyle(fontSize: 20.0),
                                            textAlign: TextAlign.center)),
                                  ],
                                ),
                            ],
                          ),
                          Divider(
                            // height: 0,
                            color: Colors.grey,
                            thickness: 1,
                          )
                        ],
                      )
                    // }
                  ],
                ),
              ));
  }
}
