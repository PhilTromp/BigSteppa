import 'package:flutter/material.dart';


class Box extends StatelessWidget {
  const Box(
      {super.key, required this.b, required this.h, required this.inhalt});
  final double b; // breite
  final double h; // höhe
  final Widget inhalt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: b, // Breite der Box
      height: h, // Höhe der Box
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 55, 55, 55), 
        borderRadius: BorderRadius.circular( 30.0),
      ),
      child:  Center(
          child: inhalt, // Hier wird das jeweilige Widget, welches als Parameter übergeben worden ist, benutzt
    ),
    );
  }
}
