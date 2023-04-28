// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:metroapp/components/button.dart';
import '../components/appbar.dart';
import '../components/myTextField.dart';
import '../components/myvariables.dart';
import 'emploi.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var EmailController = TextEditingController();

  var passwordController = TextEditingController();
  bool invalid_email = false;
  bool user_not_found = false;
  bool wrong_password = false;

  void resetErrors({bool resetInvalidEmail = true, bool resetUserNotFound = true, bool resetWrongPassword = true}) {
    setState(() {
      if (resetInvalidEmail) {
        invalid_email = false;
      }
      if (resetUserNotFound) {
        user_not_found = false;
      }
      if (resetWrongPassword) {
        wrong_password = false;
      }
    });
  }

  Future<void> login() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: EmailController.text, password: passwordController.text);
      print("utilisateur trouvé");
      // print("userCredential : $userCredential");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Emploi(
          email: EmailController.text,
        );
      }));
      // navigate('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        resetErrors(resetInvalidEmail: false);
        setState(() {
          invalid_email = true;
          print('Email incorrect.');
        });
      } else if (e.code == 'user-not-found') {
        resetErrors(resetUserNotFound: false);
        setState(() {
          user_not_found = true;
          print('Aucun utilisateur trouvé pour cet email.');
        });
      } else if (e.code == 'wrong-password') {
        resetErrors(resetWrongPassword: false);
        setState(() {
        wrong_password = true;
        print('Mot de passe incorrect.');
        });
        
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(text: "Login"),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                "Espace désigné pour les chauffeurs",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MyVariables.textColor),
              ),
              SizedBox(height: 40),
              MyTextField(
                icon: Icons.account_circle,
                controller: EmailController,
                hintText: 'Email',
                obscureText: false,
              ),
              if (invalid_email) Container(
                margin: EdgeInsets.only(left: 40),
                width: double.infinity,
                child: Text("Email incorrect.",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.start),
              ) else if (user_not_found) Container(
                margin: EdgeInsets.only(left: 40),
                width: double.infinity,
                child: Text("Aucun utilisateur trouvé pour cet email.",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.start),
              ),

              const SizedBox(height: 20),
              MyTextField(
                icon: Icons.lock,
                controller: passwordController,
                hintText: 'Mot de passe',
                obscureText: true,
              ),
              if (wrong_password) Container(
                margin: EdgeInsets.only(left: 40),
                width: double.infinity,
                child: Text("Mot de passe incorrect.",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.start),
              ),
              SizedBox(height: 40),
              Mybutton(
                text: "Se connecter",
                onPressed: () {
                  // print('Email: ${EmailController.text}');
                  // print('Password: ${passwordController.text}');
                  login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
