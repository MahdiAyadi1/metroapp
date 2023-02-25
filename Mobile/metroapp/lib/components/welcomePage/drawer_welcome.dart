import 'package:flutter/material.dart';

import '../myvariables.dart';

class MyWelcomeDrawer extends StatelessWidget {
  const MyWelcomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              color: MyVariables.backgroundColor,
              child: ListTile(
                autofocus: true,
                title: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyVariables.textColor),
                ),
                trailing: Icon(Icons.login),
              ),
            ),
          ),
        )
      ],
    ));
  }
}