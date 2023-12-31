import 'package:flutter/material.dart';

class ContentSecondPage extends StatelessWidget {
  final String tag;
  final String kcal;
  final String km;
  final String t;
  const ContentSecondPage(
      {super.key,
      required this.tag,
      required this.kcal,
      required this.km,
      required this.t});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, // Vertikal zentrieren
        crossAxisAlignment: CrossAxisAlignment.center, // Horizontal zentrieren
        children: [
          //oberes Element
          Text(
            tag,
            style: const TextStyle(
              color: Color.fromARGB(140, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //unteres Element
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Inhalte
                Row(
                  children: [
                    Icon(Icons.whatshot, color: Colors.red[300], size: 22),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      kcal,
                      style: const TextStyle(
                          color: Color.fromARGB(140, 255, 255, 255)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    const Icon(Icons.swap_calls_rounded,
                        color: Color.fromARGB(255, 68, 118, 206), size: 22),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      km,
                      style:
                          const TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    const Icon(Icons.timer_outlined,
                        color: Color.fromARGB(255, 54, 189, 148), size: 22),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      t,
                      style: const TextStyle(
                          color: Color.fromARGB(140, 255, 255, 255)),
                    )
                  ],
                )
              ],
            ),
          )
        ]);
  }
}
