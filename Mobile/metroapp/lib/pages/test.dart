// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChauffeurListScreen extends StatefulWidget {
//   @override
//   _ChauffeurListScreenState createState() => _ChauffeurListScreenState();
// }

// class _ChauffeurListScreenState extends State<ChauffeurListScreen> {
//   final CollectionReference chauffeurCollectionRef =
//       FirebaseFirestore.instance.collection('chauffeur');
//   List<dynamic> chauffeurList = [];

//   @override
//   void initState() {
//     super.initState();
//     getChauffeurs();
//   }

//   Future<void> getChauffeurs() async {
//     final QuerySnapshot snapshot = await chauffeurCollectionRef.get();
//     setState(() {
//       chauffeurList = snapshot.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: chauffeurList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text('${chauffeurList[index]['nom']} ${chauffeurList[index]['prenom']}'),
//             subtitle: Text('${chauffeurList[index]['ville']}'),
//           );
//         },
//       ),
//     );
//   }
// }