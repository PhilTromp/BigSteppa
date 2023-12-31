import 'package:flutter/material.dart';

//Modul für Authentification (Login und Register Pages)
class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller, //Eingabe
        obscureText: obscureText, //später ob Passwort angezeigt werden soll oder nicht 
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 42, 42, 42))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:  Color.fromARGB(62, 189, 189, 189))),
          fillColor: const Color.fromARGB(101, 238, 238, 238),
          filled: true,
          hintText: hintText, //Text der angezeigt wird
          hintStyle: const TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
        ),
      ),
    );
  }
}
