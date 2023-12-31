import 'package:flutter/material.dart';

class Box2 extends StatelessWidget {
  final double b; // breite
  final double h; // höhe
  final Widget inhalt;
  final bool unlockedBox2;

  const Box2(
      {super.key,
      required this.b,
      required this.h,
      required this.inhalt,
      required this.unlockedBox2});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> shadowList = [];

    if (unlockedBox2 == true) {
      shadowList.add(
        const BoxShadow(
          color: Color.fromARGB(255, 59, 255, 163), 
          blurRadius: 5, 
          spreadRadius:
              0.5, 
        ),
      );
    }

    return Container(
      width: b, // Breite der Box
      height: h, // Höhe der Box
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 55, 55, 55),
        borderRadius: BorderRadius.circular(
            30.0), 
        boxShadow:
            shadowList, 
      ),
      child: Center(
        child: inhalt,
      ),
    );
  }
}
