import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/moduls/AllAchievement/achievement_data.dart';
import 'package:big_steppa_philipp_oleg/moduls/textfield.dart';
import 'package:big_steppa_philipp_oleg/moduls/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text editing controllers
  final usernameController = TextEditingController();
  final passwortController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Registrieren Methode
  Future signUserUp() async {
    //loading Animation
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try (Registrieren) User erstellen
    try {
      //Passwörter überprüfen ob sie gleich sind
      if (passwortController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwortController.text,
        );
        addUserDetails(usernameController
            .text); //Daten werden in der Cloud Datenbank gespeichert
      } else {
        //Fehlermeldung falls Passwörter nicht gleich sind
        showErrorMessage("passwords don't match");
      }

      //loading animation beenden
      Navigator.pop(context);
    }

    //Fehlermeldung der Email oder des Passwortes
    on FirebaseAuthException catch (e) {
      //loading animation beenden
      Navigator.pop(context);
      //Fehlermeldung
      showErrorMessage(e.code);
    }
  }

  //Fehlermeldung Methode
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text(message)),
        );
      },
    );
  }

  //User Details für Datenbank
  Future addUserDetails(String email) async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await docRef.set({
      'email': email,
      'steps': 0,
      'kcal': 0,
      'km': 0,
      'goal': 50000,
      'achieve1': achievements[0].unlockedAchievement = false,
      'achieve1Box': achievements[0].unlockedBox2 = false,
      'achieve2': achievements[1].unlockedAchievement = false,
      'achieve2Box': achievements[1].unlockedBox2 = false,
      'achieve3': achievements[2].unlockedAchievement = false,
      'achieve3Box': achievements[2].unlockedBox2 = false,
      'achieve4': achievements[3].unlockedAchievement = false,
      'achieve4Box': achievements[3].unlockedBox2 = false,
      'achieve5': achievements[4].unlockedAchievement = false,
      'achieve5Box': achievements[4].unlockedBox2 = false,
      'achieve6': achievements[5].unlockedAchievement = false,
      'achieve6Box': achievements[5].unlockedBox2 = false,
      'achieve7': achievements[6].unlockedAchievement = false,
      'achieve7Box': achievements[6].unlockedBox2 = false,
      'achieve8': achievements[7].unlockedAchievement = false,
      'achieve8Box': achievements[7].unlockedBox2 = false,
      'achieve9': achievements[8].unlockedAchievement = false,
      'achieve9Box': achievements[8].unlockedBox2 = false,
      'achieve10': achievements[9].unlockedAchievement = false,
      'achieve10Box': achievements[9].unlockedBox2 = false,
      'achieve11': achievements[10].unlockedAchievement = false,
      'achieve11Box': achievements[10].unlockedBox2 = false,
      'achieve12': achievements[11].unlockedAchievement = false,
      'achieve12Box': achievements[11].unlockedBox2 = false,
      'achieve13': achievements[12].unlockedAchievement = false,
      'achieve13Box': achievements[12].unlockedBox2 = false,
      'achieve14': achievements[13].unlockedAchievement = false,
      'achieve14Box': achievements[13].unlockedBox2 = false,
      'achieve15': achievements[14].unlockedAchievement = false,
      'achieve15Box': achievements[14].unlockedBox2 = false,
      'achieve16': achievements[15].unlockedAchievement = false,
      'achieve16Box': achievements[15].unlockedBox2 = false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  const Icon(
                    Icons.directions_run,
                    size: 100,
                    color: Color.fromARGB(140, 255, 255, 255),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //Titel
                  const Text(
                    "Let\s create an account for you",
                    style: TextStyle(
                        color: Color.fromARGB(140, 255, 255, 255),
                        fontSize: 16),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: "Email-Adresse",
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //passwort textfield
                  MyTextField(
                    controller: passwortController,
                    hintText: "Passwort",
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Confirm passwort textfield
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: "Passwort bestätigen",
                      obscureText: true),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(
                    text: "sign up",
                    press: signUserUp,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //login Wechsel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(140, 255, 255, 255)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget
                            .onTap, //onTap funktion wurde rüber geliftet / Damit man screen zu Register Page wechseln kann
                        child: const Text(
                          "login now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
