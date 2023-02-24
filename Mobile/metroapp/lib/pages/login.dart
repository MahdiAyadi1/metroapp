// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import 'package:metroapp/components/myvariables.dart';
import '../components/MyTextField().dart';

class Login extends StatelessWidget {
  Login({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyVariables.mainColor,
          title: Text(
            "Login Page",
            style: TextStyle(
                fontSize: 28,
                fontFamily: 'Myfont',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              icon: Icons.account_circle,
              controller: usernameController,
              hintText: 'Utilisateur',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            MyTextField(
              icon: Icons.lock,
              controller: passwordController,
              hintText: 'Mot de passe',
              obscureText: true,
            ),
            SizedBox(height: 40),
            Mybutton(
              text: "Se connecter", 
              onPressed: () {
                    Navigator.pushNamed(context, '/emploi');
                  },),
          ],
        ),
      ),
    );
  }
}
