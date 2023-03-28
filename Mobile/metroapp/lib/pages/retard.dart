// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import '../components/appbar.dart';
import '../components/myTextField.dart';

class Retard extends StatelessWidget {
  Retard({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Retard"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              TextField(
                maxLines:
                    10, // permet à l'utilisateur de saisir plusieurs lignes
                decoration: InputDecoration(
                  labelText: 'Ecrivez ici vos causes de retard',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Mybutton(
                text: "Envoyer",
                onPressed: () {
                  Navigator.pushNamed(context, '/emploi');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
