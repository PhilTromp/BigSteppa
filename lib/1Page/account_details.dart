import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/navi_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AccountDetails extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  AccountDetails({super.key});

  //sign User out Methode
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 42, 42, 42),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 42, 42, 42), 
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 42, 42, 42)),
      ),
      home: Scaffold(
        appBar: AppBar(actions: [
          //Log Out
          IconButton(
            onPressed: () {
              // Navigieren zum zweiten Bildschirm
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Navi()), //Zurück mit der Navi Ansicht und den jeweiligen Screen
              );
            },

            icon: const Icon(Icons.close_outlined),
            color: const Color.fromARGB(140, 255, 255, 255),
          )
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              const SizedBox(height: 20,),
              const Text(
                "Benutzer: ",
                style: TextStyle(
                    color: Color.fromARGB(140, 255, 255, 255), fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.email!,
                style: const TextStyle(
                    color: Color.fromARGB(255, 68, 118, 206), fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
