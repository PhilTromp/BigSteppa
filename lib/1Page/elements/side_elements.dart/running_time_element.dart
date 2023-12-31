import 'package:flutter/material.dart';

class RunningTime extends StatelessWidget {
  const RunningTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer_outlined,
            color: Color.fromARGB(255, 54, 189, 148), size: 22),
        SizedBox(
          width: 5,
        ),
        Text(
          "01:30 h",
          style: TextStyle(
              color: Color.fromARGB(140, 255, 255, 255), fontSize: 12),
        )
      ],
    );
  }
}
