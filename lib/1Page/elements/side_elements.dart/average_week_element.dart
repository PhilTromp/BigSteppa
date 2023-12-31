import 'package:flutter/material.dart';

class AverageWeek extends StatefulWidget {
  const AverageWeek({super.key});

  @override
  State<AverageWeek> createState() => _AverageWeekState();
}

class _AverageWeekState extends State<AverageWeek> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment:
          MainAxisAlignment.center, 
      mainAxisSize:
          MainAxisSize.min, 
      children: [
        Text(
          'wöchentlicher Durchschnitt:',
          style: TextStyle(
              color: Color.fromARGB(137, 255, 255, 255),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '12 km',
          style: TextStyle(
              color: Color.fromARGB(255, 233, 155, 60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
