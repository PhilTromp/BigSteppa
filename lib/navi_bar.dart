import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/1Page/first_page.dart';
import 'package:big_steppa_philipp_oleg/2Page/second_page.dart';
import 'package:big_steppa_philipp_oleg/3Page/third_page.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});
  @override
  _NaviState createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int status = 1;

  //einzelene Screens
  final List<Widget> screens = const [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  //Navigation Button Funktion fürs switchen der Screens
  void press(int x) {
    setState(() {
      status = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[status],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 55, 55, 55),
        buttonBackgroundColor: const Color.fromARGB(255, 16, 83, 199),
        animationDuration: const Duration(milliseconds: 300),
        index: 1,
        onTap: press,
        items: const [
          Icon(Icons.history, color: Color.fromARGB(140, 255, 255, 255)),
          Icon(
            Icons.directions_run,
            color: Color.fromARGB(140, 255, 255, 255),
          ),
          Icon(
            Icons.window,
            color: Color.fromARGB(140, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SecondPage();
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const FirstPage();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThirdPage();
  }
}




