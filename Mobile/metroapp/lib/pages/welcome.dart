// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import 'package:metroapp/components/welcomePage/inputWelcome.dart';
import 'package:metroapp/components/myvariables.dart';
import '../components/appbar.dart';
import '../components/welcomePage/drawer_welcome.dart';
import '../components/welcomePage/myBoxDecoration.dart';
import '../database/bdd.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String? _selectLigne;
  String? _selectStationDepart;
  // String? _selectStationArrive;
  List<String> stationsFiltred = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: MyAppBar(text: "Book a Metro"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Icon(Icons.directions_subway),
            backgroundColor: MyVariables.mainColor,
          ),
          endDrawer: MyWelcomeDrawer(),
          body: Container(
            decoration: MyBoxDecoration(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Hello There!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: MyVariables.textColor),
                      ),
                      Text(
                        "Where are you headed today?",
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
                              _selectLigne = v.toString();
                              stationsFiltred = [];
                              _selectStationDepart = "Plus proche de ma position";
                              // _selectStationArrive = null;
                              stationsFiltred
                                  .add("Plus proche de ma position",);
                              for (int i = 0; i < station.length; i++) {
                                if (station[i]["ligne"] == v.toString()) {
                                  stationsFiltred.add(station[i]["name"]);
                                }
                              }
                              // print(_selectLigne);
                              // print(stationsFiltred);
                            });
                          },
                          selected: _selectLigne,
                          hintText: Text("Choisisser la ligne du métro ")
                          ),
                      InputWelcome(
                        selected: _selectStationDepart,
                        hintText: Text("Choisisser la station de départ "),
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
                            _selectStationDepart = value.toString();
                          });
                        },
                      ),
                      // InputWelcome(
                      //   selected: _selectStationArrive,
                      //   hintText: Text("Choisisser la station de d'arrivée "),
                      //   list: (stationsFiltred.isEmpty
                      //           ? <String>[]
                      //           : stationsFiltred.sublist(1, stationsFiltred.length))
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value,style: TextStyle(fontSize: 20)),
                      //     );
                      //   }).toList(),
                      //   onChange: (value) {
                      //     setState(() {
                      //       _selectStationArrive = value.toString();
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
                Mybutton(
                  text: "Find Metro",
                  onPressed: () {
                    ((_selectStationDepart == null)
                    //  ||
                    //  (_selectStationArrive == null)
                     )
                        ? null
                        : Navigator.pushNamed(context, '/findmetro');
                  },
                )
              ],
            ),
          )),
    );
  }
}
