// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import '../components/appbar.dart';
import '../components/myTextField.dart';
import 'emploi.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var CinController = TextEditingController();

  var passwordController = TextEditingController();

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
              controller: CinController,
              hintText: 'CIN',
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
                print('CIN: ${CinController.text}');
                print('Password: ${passwordController.text}');
                // Navigator.pushNamed(context, '/emploi');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Emploi(CIN: CinController.text,);
                  // return FindmetroTest(selectLigne,selectStationDepart,stationsFiltredMap);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
