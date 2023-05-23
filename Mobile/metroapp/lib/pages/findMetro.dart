// ignore_for_file: prefer_const_constructors, avoid_print, unused_element, unused_field, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metroapp/pages/prediction.dart';
import '../components/appbar.dart';
import '../components/FindMetroCard.dart';

class Findmetro extends StatefulWidget {
  final String? selectLigne;
  final String? selectStationDepart;
  final List<Map> stationsFiltredMap;
  const Findmetro({
    required this.selectLigne,
    required this.selectStationDepart,
    required this.stationsFiltredMap,
    Key? key,
  }) : super(key: key);


  @override
  State<Findmetro> createState() => _FindmetroState();
}

class _FindmetroState extends State<Findmetro> {
  Position? _position = Position(
      latitude: 0.0,
      longitude: 0.0,
      altitude: 0.0,
      accuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      timestamp: DateTime.now(),
      heading: 0.0);
  String? plusProcheStationName = "";
  Map stationDepart = {};

  final CollectionReference MetroMouvementCollectionRef =
      FirebaseFirestore.instance.collection('metro_mouvement');
  List<dynamic> MetroMouvementList = [];
  List<dynamic> MetroMouvementListForBarcelone = [];
  List<dynamic> MetroMouvementListForTerminus = [];
  // List<Map<String, dynamic>> MetroMouvementSelectedLigne = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getMetroMouvements();
  }

  Future<void> getMetroMouvements() async {
    // setState(() {
    //   isLoading = true;
    // });
    final QuerySnapshot<Object?> snapshot =
        await MetroMouvementCollectionRef.get();
    final List<Map<String, dynamic>> MetroMouvements = snapshot.docs
        .map<Map<String, dynamic>>(
            (doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
    setState(() {
      MetroMouvementList = MetroMouvements.where((metro) =>
              (metro['ligne']) ==
              widget.selectLigne!.substring(widget.selectLigne!.length - 1))
          .toList();
      // print("MetroMouvementList From Bdd : $MetroMouvementList");
      isLoading = false;
    });
  }

  Future<double> getPositionAndDistance(
      double latitude, double longitude) async {
    // try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("permission denied");
      permission = await Geolocator.requestPermission();
      // if (permission != LocationPermission.whileInUse &&
      //     permission != LocationPermission.always) {
      //   return -999;
      // }
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("localisation avec position: $position");
      _position = position;
    }
    print("localisation: $_position");
    double distance = Geolocator.distanceBetween(
      _position!.latitude,
      _position!.longitude,
      latitude,
      longitude,
    );
    return distance;
    // } catch (e) {
    //   print(e);
    //   return -999;
    // }
  }

  Future<double> PlusProcheStationDistance() async {
    List<Future<Map<String, dynamic>>> distancesFutures = [];
    Map<String, dynamic> minDistance = {};
    try {
      for (var station in widget.stationsFiltredMap) {
        Future<double> futureDistance = getPositionAndDistance(
            station["coordinates"][0], station["coordinates"][1]);
        distancesFutures.add(futureDistance.then((double distance) {
          return {"name": station["name"], "distance": distance};
        }));
      }
      List<Map<String, dynamic>> distances =
          await Future.wait(distancesFutures);
      minDistance = distances.reduce((actuelle, suivante) =>
          actuelle["distance"] < suivante["distance"] ? actuelle : suivante);
      // print(minDistance);
      // print(minDistance["distance"]);
      plusProcheStationName = minDistance["name"];
      for (var map in widget.stationsFiltredMap) {
        if (map['name'] == plusProcheStationName) {
          stationDepart = map;
          Direction(stationDepart);
          break;
        }
      }
      // print("minDistance ============================================ $distances");
      return minDistance["distance"];
    } catch (e) {
      print(e);
      return -999;
    }
  }

  Future<double> SelectedStationDepartDistance() {
    plusProcheStationName = widget.selectStationDepart;
    for (var map in widget.stationsFiltredMap) {
      if (map['name'] == widget.selectStationDepart) {
        stationDepart = map;
        Direction(stationDepart);
        break;
      }
    }
    return getPositionAndDistance(
        stationDepart['coordinates'][0], stationDepart['coordinates'][1]);
  }

  int DistanceToTime(double distance, double vitesse) {
    return (((distance / 1000.0) / (vitesse / 60.0)).round());
  }

//stationDepartName == plusProcheStationName
  void Direction(StationDepart) {
    print("MetroMouvementList====$MetroMouvementList");
    // print("StationDepart====$StationDepart");
    MetroMouvementListForBarcelone = MetroMouvementList.where((metro) =>
        ((metro["direction"] == "centreVille") &&
            (metro["num"] > StationDepart["num"]))).toList();
    print("MetroMouvementListForBarcelone====$MetroMouvementListForBarcelone");
    MetroMouvementListForTerminus = MetroMouvementList.where((metro) =>
        ((metro["direction"] == "terminus") &&
            (metro["num"] < StationDepart["num"]))).toList();
    print("MetroMouvementListForTerminus====$MetroMouvementListForTerminus");
  }

  @override
  Widget build(BuildContext context) {
    // print("localisation: $_position");
    // print(widget.selectStationDepart);
    // print(widget.selectLigne);
    // print("===${widget.stationsFiltredMap}");
//     print(
// "==================================BEGIN RENDER==========================================================");
    // print("MetroMouvementList From Bdd : $MetroMouvementList");
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Trouver votre métro"),
        body: Column(
          children: [
            FutureBuilder<double>(
              future: widget.selectStationDepart == 'Plus proche de ma position'
                  ? PlusProcheStationDistance()
                  : SelectedStationDepartDistance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int minutes = DistanceToTime(snapshot.data!, 4.5);
                  return ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 13),
                    title: Text(
                      "Votre station : $plusProcheStationName",
                      style: TextStyle(
                        fontSize: 22.5,
                        fontWeight: FontWeight.w400,
                        color: MyVariables.secondColor,
                      ),
                    ),
                    subtitle: Text(
                      "Vous arrivez dans $minutes minutes",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: MyVariables.secondColor,
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    title: Text(
                      'Calcul de la distance en cours...',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: MyVariables.secondColor,
                      ),
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: MyVariables.secondColor,
                      ),
                    ),
                  );
                }
              },
            ),
            // Text("data"),
            FutureBuilder<double>(
                future: getPositionAndDistance(0, 0),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                              itemCount: MetroMouvementListForBarcelone.length +
                                  MetroMouvementListForTerminus.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < MetroMouvementListForBarcelone.length) {
                                  double distance =
                                            Geolocator.distanceBetween(
                                          MetroMouvementListForBarcelone[index]
                                              ['location'][0],
                                          MetroMouvementListForBarcelone[index]
                                              ['location'][1],
                                          stationDepart['coordinates'][0],
                                          stationDepart['coordinates'][1],
                                        );
                                      print("distance======== $distance");
                                  return FutureBuilder<int>(
                                    future:
                                        predict([1, 0, "12:00:00", distance, 1, 5]),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: FindMetroCard(
                                            idMetro:
                                                MetroMouvementListForBarcelone[
                                                    index]['id_metro'],
                                            temps: snapshot.data!,
                                            direction: "Centre Ville",
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          margin:EdgeInsets.only(bottom: 50),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  int newIndex = index -
                                      MetroMouvementListForBarcelone.length;
                                      double distance =
                                            Geolocator.distanceBetween(
                                          MetroMouvementListForTerminus[
                                              newIndex]['location'][0],
                                          MetroMouvementListForTerminus[
                                              newIndex]['location'][1],
                                          stationDepart['coordinates'][0],
                                          stationDepart['coordinates'][1],
                                        );
                                        // print("distance ============================= $distance");
                                  return FutureBuilder<int>(
                                    future:
                                        predict([1, 0, "12:00:00", distance, 1, 5]),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: FindMetroCard(
                                            idMetro:
                                                MetroMouvementListForTerminus[
                                                    newIndex]['id_metro'],
                                            temps: snapshot.data!,
                                            direction: "Terminus",
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 50),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                    );
                  } else {
                    return Text("");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
