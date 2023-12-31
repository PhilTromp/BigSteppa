import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? press;
  final String text;

  const MyButton({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 55, 55, 55), borderRadius: BorderRadius.circular(8)),
        child:  Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
      ),
    );
  }
}
