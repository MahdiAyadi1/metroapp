// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';

import '../components/appbar.dart';

class Emploi extends StatelessWidget {
  const Emploi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> info = [
      {
        "metro": "M_5",
        "ligne": "4",
        "horaire": "8h",
      },
      {
        "metro": "M_9",
        "ligne": "5",
        "horaire": "11h",
      },
      {
        "metro": "M_7",
        "ligne": "4",
        "horaire": "14h",
      },
      {
        "metro": "M_1",
        "ligne": "3",
        "horaire": "18h",
      },
    ];
    return SafeArea(
      child: Scaffold(
          endDrawer: Drawer(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: MyVariables.secondColor),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    accountName: Text(
                      "Mohamed Chaabouni",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text(
                      "Mohamed.chaabouni@ensi-uma.tn",
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/welcome');
                    },
                    child: Card(
                      color: MyVariables.backgroundColor,
                      child: ListTile(
                        autofocus: true,
                        title: Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        trailing: Icon(Icons.logout),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          appBar: MyAppBar(text: "Emploi Page"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/retard');
            },
            child: Icon(Icons.notification_important),
            backgroundColor: MyVariables.mainColor,
          ),
          body: Table(
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
              for (int i = 0; i < info.length; i++)
                TableRow(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(info[i]["metro"],
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(info[i]["ligne"],
                              style: TextStyle(fontSize: 20.0))),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(info[i]["horaire"],
                              style: TextStyle(fontSize: 20.0))),
                    ),
                  ],
                ),
            ],
          )),
    );
  }
}
