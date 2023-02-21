// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
            backgroundColor: Colors.indigoAccent,
            title: Text(
              "Book a Metro",
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Myfont',
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
          body: ListView(
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
                          color: Colors.grey[800]),
                    ),
                    Text(
                      "Where are you headed today?",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // Text("Choisisser la ligne du métro: "),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 350,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton(
                        //dropdownColor: Colors.grey[200],
                        itemHeight: 60,
                        style:
                            TextStyle(fontSize: 18.5, color: Colors.grey[800]),
                        isExpanded: true,
                        items: ligne
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            _selectLigne = v.toString();
                            stationsFiltred = [];
                            _selectStationDepart=null;
                            _selectStationArrive=null;
                            for (int i = 0; i < station.length; i++) {
                              if (station[i]["ligne"] == v.toString()) {
                                stationsFiltred.add(station[i]["name"]);
                              }
                            }
                            // _selectStationDepart = stationsFiltred[0];
                            // print(stationsFiltred);
                            // print(selectStation);
                          });
                        },
                        value: _selectLigne,
                        hint: Text("Choisisser la ligne du métro: "),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 350,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          itemHeight: 60,
                          style: TextStyle(
                              fontSize: 18.5, color: Colors.grey[800]),
                          isExpanded: true,
                          value: _selectStationDepart,
                          items: (stationsFiltred.isEmpty
                                  ? <String>[]
                                  : stationsFiltred)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectStationDepart = value.toString();
                            });
                          },
                          disabledHint: Text('désactivé'),
                          hint: Text("Choisisser la station de départ"),
                        )),
                        Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 350,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<String>(
                          itemHeight: 60,
                          style: TextStyle(
                              fontSize: 18.5, color: Colors.grey[800]),
                          isExpanded: true,
                          value: _selectStationArrive,
                          items: (stationsFiltred.isEmpty
                                  ? <String>[]
                                  : stationsFiltred)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectStationArrive = value.toString();
                            });
                          },
                          disabledHint: Text('désactivé'),
                          hint: Text("Choisisser la station de d'arrivée"),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 68),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/findmetro');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[900]),
                    padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                  ),
                  child: Text(
                    "click here",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
