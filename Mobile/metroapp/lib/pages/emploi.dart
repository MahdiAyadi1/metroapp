// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';

import '../components/appbar.dart';

class Emploi extends StatelessWidget {
  const Emploi({super.key});

  @override
  Widget build(BuildContext context) {
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
                  accountName: Text("Mohamed Chaabouni",style: TextStyle(fontSize: 18),), 
                  accountEmail: Text("Mohamed.chaabouni@ensi-uma.tn",style: TextStyle(fontSize: 18),)),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  
                  child: GestureDetector(
                    onTap: (){Navigator.pushNamed(context, '/welcome');},
                    child: Card(
                      color: MyVariables.backgroundColor,
                      child: ListTile(autofocus: true,
                      title: Text("Log out",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                      trailing: Icon(Icons.logout),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ),
        appBar: MyAppBar(text: "Emploi Page"),
        body: Text("Emploi Page")
      ),
    );
  }
}