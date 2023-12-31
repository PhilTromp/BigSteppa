import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/moduls/textfield.dart';
import 'package:big_steppa_philipp_oleg/moduls/button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text editing controllers
  final usernameController = TextEditingController();

  final passwortController = TextEditingController();

  //Anmelden Methode
  void signUserIn() async {
    //loading Animation
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try (Anmelden) User erstellen
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwortController.text,
      );

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
                    "Willkommen zurück",
                    style: TextStyle(color: Color.fromARGB(140, 255, 255, 255), fontSize: 16),
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

                  //forgot password (Dekoration)
                  // Row mit Padding damit es Rechts ist
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Passwort vergessen?",
                          style: TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(
                    text: "sign in",
                    press: signUserIn,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //register Wechsel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "not a member?",
                        style: TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget
                            .onTap, //onTap funktion wurde rüber geliftet / Damit man screen zu Register Page wechseln knn
                        child: const Text(
                          "register now",
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
