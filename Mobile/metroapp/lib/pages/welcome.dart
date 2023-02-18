// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
                    onTap: (){Navigator.pushNamed(context, '/login');},
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(autofocus: true,
                      title: Text("Login",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                      trailing: Icon(Icons.login),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 350,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.tram_sharp,
                              color: Colors.grey[800],
                            ),
                            hintText: "Metro Lign :",
                            border: InputBorder.none),
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
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey[800],
                            ),
                            hintText: " Station de départ :",
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 350,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey[800],
                            ),
                            hintText: "Station d'arrivé :",
                            border: InputBorder.none),
                      ),
                    ),
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
