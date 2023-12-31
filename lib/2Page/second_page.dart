import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/2Page/content_second_page.dart';
import 'package:big_steppa_philipp_oleg/moduls/box.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> wochentage = [
      'Montag:',
      'Dienstag:',
      'Mittwoch:',
      'Donnerstag:',
      'Freitag:',
      'Samstag:',
      'Sonntag:'
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
      child: Column(
        children: [
          const Text("Verlauf", style: TextStyle(fontSize: 25, color: Colors.white54, fontWeight: FontWeight.bold),),
          const Text("(Dekoration)", style: TextStyle(fontSize: 10, color: Colors.white54),),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: wochentage.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    child: Box(
                        b: 200,
                        h: 100,
                        inhalt: ContentSecondPage(
                          tag: wochentage[index],
                          kcal: "300 kcal",
                          km: "2 km",
                          t: "01.30 h",
                        )
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

