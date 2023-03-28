// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:metroapp/database/sqflite/sqldb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // SqlDb sqlDB = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Insert Data",style: TextStyle(fontSize: 25),),
                onPressed: () async{
                  // int response = await sqlDB.insertData(
                  //   "INSERT INTO 'ligne' ('num_ligne','nb_stations') VALUES (1,11)");
                    // print(response);
                },),
            ),
            SizedBox(height: 30,),
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Read Data",style: TextStyle(fontSize: 25),),
                onPressed: () async{
                  // List<Map> response = await sqlDB.readData("Select * FROM 'ligne'");
                  // print(response);
                  
                },),
            ),
            SizedBox(height: 30,),
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Delet DataBase",style: TextStyle(fontSize: 25),),
                onPressed: () async{
                  // await sqlDB.mydeleteDataBase();
                  print("Database Deleted");
                  
                },),
            ),
          ],
        ),
      )
    );
  }
}