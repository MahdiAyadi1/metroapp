// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
                      color: Colors.grey[200],
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
        appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Emploi Page",style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Myfont',
                  fontWeight: FontWeight.bold),),
        centerTitle: true,

        ),
        body: Text("Emploi Page")
      ),
    );
  }
}