// ignore_for_file: prefer_const_constructors, avoid_print, unused_element, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';
import 'package:geolocator/geolocator.dart';
import '../components/appbar.dart';

class FindmetroTest extends StatefulWidget {
  String? selectLigne;
  String? selectStationDepart;
  List<Map>? stationsFiltredMap;
  FindmetroTest(String l, String s, List<Map> liste, {super.key}) {
    selectLigne = l;
    selectStationDepart = s;
    stationsFiltredMap = liste;
  }

  @override
  State<FindmetroTest> createState() => _FindmetroTestState();
}

class _FindmetroTestState extends State<FindmetroTest> {
  // Position? _position;
  // List<double>? _coordStationDepart;

  Future<double> getPositionAndDistance(
      double latitude, double longitude) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return -999;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return -999;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("localisation: $position");

      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        latitude,
        longitude,
      );
      return distance;
    } catch (e) {
      print(e);
      return -999;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? plusProcheStationName = "";

    Future<double> PlusProcheStationDistance() async {
      List<Future<Map<String, dynamic>>> distancesFutures = [];
      Map<String, dynamic> minDistance = {};
      try {
        for (var station in widget.stationsFiltredMap!) {
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
        print(minDistance);
        print(minDistance["distance"]);
        plusProcheStationName = minDistance["name"];
        return minDistance["distance"];
      } catch (e) {
        print(e);
        return -999;
      }
    }

    Future<double> SelectedStationDepartDistance() {
      List<double> coordStationDepart = [];
      plusProcheStationName = widget.selectStationDepart;
      for (var map in widget.stationsFiltredMap!) {
        if (map['name'] == widget.selectStationDepart) {
          coordStationDepart = map['coordinates'];
        }
      }
      for (var map in widget.stationsFiltredMap!) {
        if (map['name'] == widget.selectStationDepart) {
          coordStationDepart = map['coordinates'];
        }
      }
      return getPositionAndDistance(
          coordStationDepart[0], coordStationDepart[1]);
    }

    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar(text: "Find metro Page"),
          body: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              FutureBuilder<double>(
                future:
                    widget.selectStationDepart == 'Plus proche de ma position'
                        ? PlusProcheStationDistance()
                        : SelectedStationDepartDistance(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // print("Snapshot : ${snapshot.data}");
                    double vitesse = 4.0;
                    int minutes =
                        ((snapshot.data! / 1000.0) / (vitesse / 60.0)).round();
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                      title: Text(
                        "Votre station : $plusProcheStationName",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: MyVariables.secondColor,
                        ),
                      ),
                      subtitle: Text(
                        "Vous arrivez dans $minutes minutes",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: MyVariables.secondColor,
                        ),
                      ),
                    );
                  } else {
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(10, 30, 10, 30),
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
              Card(
                color: Color.lerp(
                    MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
                // color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),

                // shadowColor: MyVariables.mainColor,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
                  title: Text(
                    "Metro 1",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text("Arrive dans 5 minutes",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      )),
                  subtitle: Text(
                    "Dans 20-Mars",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Card(
                color: Color.lerp(
                    MyVariables.mainColor, MyVariables.backgroundColor, 0.6),

                // shadowColor: MyVariables.mainColor,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
                  title: Text(
                    "Metro 2",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Arrive dans 10 minutes",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "Dans Denden",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Card(
                color: Color.lerp(
                    MyVariables.mainColor, MyVariables.backgroundColor, 0.6),

                // shadowColor: MyVariables.mainColor,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
                  title: Text(
                    "Metro 3",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Arrive dans 25 minutes",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "Dans Manouba",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}