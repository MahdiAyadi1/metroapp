// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/myvariables.dart';

import '../components/appbar.dart';
import '../database/mysql/testMySql.dart';

class Findmetro extends StatelessWidget {
  const Findmetro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Find metro Page"),
        body: ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
          title: Text("Votre station : Bouchoucha",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: MyVariables.secondColor),),
          // trailing: Text("Arrive dans 5 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,)),
          subtitle: Text("Vous arrivez dans 4 minutes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: MyVariables.secondColor),),
        ),
          
          Card(
            color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            // color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
            // shadowColor: MyVariables.mainColor,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
              title: Text("Metro 1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              trailing: Text("Arrive dans 5 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,)),
              subtitle: Text("Dans 20-Mars",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
          ),
          
          Card(
            color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
            // shadowColor: MyVariables.mainColor,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
              title: Text("Metro 2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              trailing: Text("Arrive dans 10 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
              subtitle: Text("Dans Denden",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
          ),
          
          Card(
            color: Color.lerp(MyVariables.mainColor, MyVariables.backgroundColor, 0.6),
            
            // shadowColor: MyVariables.mainColor,
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 35, 15, 35),
              title: Text("Metro 3",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              trailing: Text("Arrive dans 25 minutes",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
              subtitle: Text("Dans Manouba",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            ),
          ),
          
        
      ],
    )
      ),
    );
  }
}