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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Mon application'),
                ),
                ListTile(
                  title: Text('Page 1'),
                  onTap: () {
                    // Mettre à jour le contenu de la page
                  },
                ),
                ListTile(
                  title: Text('Page 2'),
                  onTap: () {
                    // Mettre à jour le contenu de la page
                  },
                ),
              ],
            ),
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
                              Icons.search,
                              color: Colors.grey[800],
                            ),
                            hintText: "Metro Lign :",
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
                            hintText: "Metro Station :",
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 68),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
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
