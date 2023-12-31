import 'package:flutter/material.dart';

class KmDistance extends StatefulWidget {
  final double km;
  const KmDistance({super.key, required this.km});

  @override
  State<KmDistance> createState() => _KmDistanceState();
}

class _KmDistanceState extends State<KmDistance> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.swap_calls_rounded,
            color: Color.fromARGB(255, 68, 118, 206), size: 22),
        const SizedBox(
          width: 5,
        ),
        Text(
          "${widget.km} km",
          style: const TextStyle(
              color: Color.fromARGB(140, 255, 255, 255), fontSize: 12),
        )
      ],
    );
  }
}
