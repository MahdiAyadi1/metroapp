// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import '../components/appbar.dart';
import '../components/myTextField.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Login"),
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
