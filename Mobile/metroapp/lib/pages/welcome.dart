// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import 'package:metroapp/components/inputWelcome.dart';
import 'package:metroapp/components/myvariables.dart';
import '../database/bdd.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String? _selectLigne;
  String? _selectStationDepart;
  String? _selectStationArrive;
  List<String> stationsFiltred = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyVariables.mainColor,
            title: Text(
              "Book a Metro",
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: MyVariables.titleFont,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          endDrawer: Drawer(
              child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Card(
                    color: Colors.grey[200],
                    child: ListTile(
                      autofocus: true,
                      title: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      trailing: Icon(Icons.login),
                    ),
                  ),
                ),
              )
            ],
          )),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
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
                        height: 50,
                      ),
                      // Text("Choisisser la ligne du métro: "),
                      InputWelcome(
                          list: ligne
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          OnChange: (v) {
                            setState(() {
                              _selectLigne = v.toString();
                              stationsFiltred = [];
                              _selectStationDepart = null;
                              _selectStationArrive = null;
                              for (int i = 0; i < station.length; i++) {
                                if (station[i]["ligne"] == v.toString()) {
                                  stationsFiltred.add(station[i]["name"]);
                                }
                              }
                              // print(_selectLigne);
                              // print(stationsFiltred);
                            });
                          },
                          selectLigne: _selectLigne,
                          hintText: Text("Choisisser la ligne du métro ")),
                      InputWelcome(
                        selectLigne: _selectStationDepart,
                        hintText: Text("Choisisser la station de départ "),
                        list: (stationsFiltred.isEmpty
                                ? <String>[]
                                : stationsFiltred)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        OnChange: (value) {
                          setState(() {
                            _selectStationDepart = value.toString();
                          });
                        },
                      ),
                      InputWelcome(
                        selectLigne: _selectStationArrive,
                        hintText: Text("Choisisser la station de d'arrivée "),
                        list: (stationsFiltred.isEmpty
                                ? <String>[]
                                : stationsFiltred)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        OnChange: (value) {
                          setState(() {
                            _selectStationArrive = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Mybutton(
                  text: Text(
                    "click here",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/findmetro');
                  },
                )
              ],
            ),
          )),
    );
  }
}
