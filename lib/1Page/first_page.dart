import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/1Page/elements/side_elements.dart/calories_element.dart';
import 'package:big_steppa_philipp_oleg/1Page/elements/side_elements.dart/km_element.dart';
import 'package:big_steppa_philipp_oleg/1Page/elements/side_elements.dart/running_time_element.dart';
import 'package:big_steppa_philipp_oleg/moduls/box.dart';
import 'package:big_steppa_philipp_oleg/1Page/elements/side_elements.dart/average_week_element.dart';
import 'package:big_steppa_philipp_oleg/1Page/elements/tracking_element.dart';
import 'package:big_steppa_philipp_oleg/1Page/account_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? cloudEmail;
  int transferSteps = 0;
  double cloudKcal = 0;
  double cloudKm = 0;
  double roundedCloudKcal = 0;
  double roundedCloudKm = 0;

  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final data = await docRef.get();
    final userData = data.data();
    setState(() {
      cloudEmail = userData!['email'];
      if (userData['kcal'] is int) {
        cloudKcal = (userData['kcal'] as int).toDouble();
      } else {
        cloudKcal = userData['kcal'];
      }
      if (userData['km'] is int) {
        cloudKm = (userData['km'] as int).toDouble();
      } else {
        cloudKm = userData['km'];
      }
    });
  }

  void updateSteps(String steps) {
    setState(() {
      transferSteps = int.parse(steps);
      cloudKcal = transferSteps * 0.05;
      cloudKm = (transferSteps * 0.6) / 1000;
      roundedCloudKcal = double.parse(cloudKcal.toStringAsFixed(
          2)); // Nur auf zwei Nachkommastellen begrenzen für Anzeige (aber nicht in der Cloud)
      roundedCloudKm = double.parse(cloudKm.toStringAsFixed(2));

      updateUserKcalKm(cloudKcal, cloudKm);
    });
  }

  Future<void> updateUserKcalKm(double kcal, double km) async {
    await docRef.update({'kcal': kcal, 'km': km});
  }

//sign User out Methode
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    //Datum
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}.${now.month}.${now.year}";
    //Wochentag für aktuellen Tag
    String getTodayWeekday() {
      List<String> weekdays = [
        'Montag',
        'Dienstag',
        'Mittwoch',
        'Donnerstag',
        'Freitag',
        'Samstag',
        'Sonntag'
      ];
      DateTime now = DateTime.now();
      return weekdays[now.weekday - 1];
    }

    String todayWeekday = getTodayWeekday();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: signUserOut,
          icon: const Icon(Icons.logout),
          color: Colors.red[300],
        ),
        title: Center(
          child: Text(
            "$todayWeekday / $formattedDate",
            style: const TextStyle(
                color: Color.fromARGB(140, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigieren zum zweiten Bildschirm
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountDetails(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
            color: const Color.fromARGB(255, 68, 118, 206),
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            //HauptÜbersicht: Schritte und Ziel
            Box(
              b: 350,
              h: 400,
              inhalt: TrackingElement(
                onStepsChanged: updateSteps,
              ),
            ),
            const SizedBox(height: 40),
            //weitere Infos (Kcal, Strecke, Zeit)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Box(
                    b: 100,
                    h: 50,
                    inhalt: CaloriesElement(
                      kcal: roundedCloudKcal,
                    )),
                const SizedBox(width: 10),
                Box(b: 100, h: 50, inhalt: KmDistance(km: roundedCloudKm)),
                const SizedBox(width: 10),
                const Box(b: 100, h: 50, inhalt: RunningTime()),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            //wöchentlicher Durchscnitt
            const AverageWeek(),
          ],
        ),
      ),
    );
  }
}
