import 'package:flutter/material.dart';

class CaloriesElement extends StatefulWidget {
  final double kcal;
  const CaloriesElement({super.key, required this.kcal});

  @override
  State<CaloriesElement> createState() => _CaloriesElementState();
}

class _CaloriesElementState extends State<CaloriesElement> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.whatshot, color: Colors.red[300], size: 22),
        const SizedBox(
          width: 5,
        ),
        Text(
          "${widget.kcal.toString()} Kcal",
          style: const TextStyle(
              color: Color.fromARGB(140, 255, 255, 255), fontSize: 12),
        )
      ],
    );
  }
}
