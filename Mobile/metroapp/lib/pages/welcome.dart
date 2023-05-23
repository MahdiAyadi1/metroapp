// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import 'package:metroapp/components/welcomePage/inputWelcome.dart';
import 'package:metroapp/components/myvariables.dart';
import '../components/appbar.dart';
// import '../components/welcomePage/drawer_welcome.dart';
import '../components/welcomePage/myBoxDecoration.dart';
import '../database/bdd.dart';
import 'findMetro.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String? selectLigne;
  String? selectStationDepart;
  // String? _selectStationArrive;
  List<String> stationsFiltred = [];
  List<Map> stationsFiltredMap = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar(text: "Réserver un métro"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            backgroundColor: MyVariables.mainColor,
            child: Icon(Icons.directions_subway),
          ),
          // endDrawer: MyWelcomeDrawer(),
          body: Container(
            decoration: MyBoxDecoration(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Bonjour!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: MyVariables.textColor),
                      ),
                      Text(
                        "Où vas-tu aujourd'hui?",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: MyVariables.textColor),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      
                      // Text("Choisisser la ligne du métro: "),
                      InputWelcome(
                          list: ligne
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e,style: TextStyle(fontSize: 20))))
                              .toList(),
                          onChange: (v) {
                            setState(() {
                              selectLigne = v.toString();
                              stationsFiltred = [];
                              stationsFiltredMap = [];
                              selectStationDepart = "Plus proche de ma position";
                              // _selectStationArrive = null;
                              stationsFiltred
                                  .add("Plus proche de ma position",);
                              for (Map singleStation in station) {
                                if (singleStation["ligne"] == v.toString()) {
                                  stationsFiltred.add(singleStation["name"]);
                                  stationsFiltredMap.add(
                                    {"name":singleStation["name"],
                                    "coordinates": singleStation['coordinates'],
                                    "num" : singleStation['num']
                                    }
                                    );
                                }
                              }
                              // print(stationsFiltredMap);
                              // print(_selectLigne);
                              // print(stationsFiltred);
                            });
                          },
                          selected: selectLigne,
                          hintText: Text("Choisissez la ligne du métro ")
                          ),
                      InputWelcome(
                        selected: selectStationDepart,
                        hintText: Text("Choisissez la station de départ "),
                        list: (stationsFiltred.isEmpty
                                ? <String>[]
                                : stationsFiltred)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: value == "Plus proche de ma position" ? 
                            ListTile(
                              // tileColor: Colors.blue[100],
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.location_on,size: 35,),
                              title: Text(value,style: TextStyle(fontSize: 20,color: Colors.blue[900]),),
                              iconColor: MyVariables.secondColor,
                            ) : 
                            Text(value,style: TextStyle(fontSize: 20))
                          );
                        }).toList(),
                        onChange: (value) {
                          setState(() {
                            selectStationDepart = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Mybutton(
                  text: "Trouver métro",
                  onPressed: () {
                    ((selectStationDepart == null)
                    //  ||
                    //  (_selectStationArrive == null)
                     )
                        ? null
                        : 
                        // Navigator.pushNamed(context, '/test');
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return Findmetro(selectLigne: selectLigne,selectStationDepart: selectStationDepart,stationsFiltredMap: stationsFiltredMap,);
                          })
                        );
                  },
                )
              ],
            ),
          )),
    );
  }
}
