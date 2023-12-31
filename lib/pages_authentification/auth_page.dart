import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/navi_bar.dart';
import 'package:big_steppa_philipp_oleg/pages_authentification/login_or_register_page.dart';

//diese Page sorgt für den Wechsel zwischen HomePage und LoginPage
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) { //Wenn er email und password übergeben bekommen hat, die miteinander einstimmen, dann wechselt er automatisch auf Homepage (die Sign in Methode in loginpage füllt nur die Datentypen)
            return const Navi();
          }

          //user is NOT logged in
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}


