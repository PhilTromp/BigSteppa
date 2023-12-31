import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/moduls/AllAchievement/achievement_element.dart';
import 'package:big_steppa_philipp_oleg/moduls/AllAchievement/box_2.dart';
import 'package:big_steppa_philipp_oleg/moduls/AllAchievement/achievement_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

int totalSteps = 100000000;
int totalKcal = 10000;
int timeSteps = 10000; //funktioniert nicht, nur Dekoration
int secondTimeSteps = 2000; //funktioniert nicht, nur Dekoration

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int cloudAchievementSteps = 0;
  double cloudAchievementKcal = 0;
  List<bool> cloudAchievements = List.filled(achievements.length, false);

  //Instanz für Cloud Dokument
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  
  //Variablen 
  Future<void> getUserData() async {
    final data = await docRef.get();
    final userData = data.data();

    setState(() {
      cloudAchievementSteps = userData![
          'steps']; // Setze cloudSteps auf den Wert aus der Cloud oder 0, falls kein Wert vorhanden ist
      cloudAchievementKcal = userData[
          'kcal']; // Setze cloudSteps auf den Wert aus der Cloud oder 0, falls kein Wert vorhanden ist

      for (int i = 0; i < achievements.length; i++) {
      achievements[i].unlockedAchievement = userData['achieve${i + 1}'] ?? false;
      achievements[i].unlockedBox2 = userData['achieve${i + 1}Box'] ?? false;
    }
    });
  }

  //If Anweisungen Änderungen für achievements / Datenbank
  Future<void> updateSpecificAchievementInCloud(int index) async {
  final Map<String, dynamic> achievementData = {
    'achieve${index + 1}': achievements[index].unlockedAchievement,
    'achieve${index + 1}Box': achievements[index].unlockedBox2,
  };

  await docRef.update(achievementData);
}


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    //Bedingungen für alle Achievements
    //MeilenStein 1-4
    if (cloudAchievementSteps >= 1000) {
      setState(() {
        achievements[0].unlockedAchievement = true;
        achievements[0].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(0);
    } 

    if (cloudAchievementSteps >= 10000) { 
      setState(() {
        achievements[1].unlockedAchievement = true;
        achievements[1].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(1);
    } 
 
    if (cloudAchievementSteps >= 100000) { 
      setState(() {
        achievements[2].unlockedAchievement = true;
        achievements[2].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(2);
    } 
    if (cloudAchievementSteps >= 1000000) {
      setState(() {
        achievements[3].unlockedAchievement = true;
        achievements[3].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(3);
    } 
    //Kalorienverbrenner MeilenStein 1-4
    if (cloudAchievementKcal >= 500) {
      setState(() {
        achievements[4].unlockedAchievement = true;
        achievements[4].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(4);
    }
    if (cloudAchievementKcal >= 1000) {
      setState(() {
        achievements[5].unlockedAchievement = true;
        achievements[5].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(5);
    } 
    if (cloudAchievementKcal >= 1500) {
      setState(() {
        achievements[6].unlockedAchievement = true;
        achievements[6].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(6);
    }
    if (cloudAchievementKcal >= 3000) {
      setState(() {
        achievements[7].unlockedAchievement = true;
        achievements[7].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(7);
    } 
    //Marathonmeister: 42 km – 28.000 Schritte
    if (totalSteps >= 28000) {
      setState(() {
        achievements[10].unlockedAchievement = true;
        achievements[10].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(8);
    }
    //Bergsteiger: Mount Everest – 8.849 m - 12.641 Schritte
    if (totalSteps >= 12641) {
      setState(() {
        achievements[11].unlockedAchievement = true;
        achievements[11].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(9);
    }
    //Globetrotter: Äquator  X: 40.075 Kilometer - 50.093.750 Schritte
    if (totalSteps >= 50093750) {
      setState(() {
        achievements[12].unlockedAchievement = true;
        achievements[12].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(10);
    }
    //Treppenmeister: Niesenbahn in der Schweiz - 11.674 Stufen - 11.674 Schritte
    if (totalSteps >= 11674) {
      setState(() {
        achievements[13].unlockedAchievement = true;
        achievements[13].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(11);
    }
    //Ab hier alle Dekoration, weil Zeit Api... nicht vorhanden
    //Speed Walker: 10 km/h – 30 min – 4.170 Schritte (Zeit)
    if (timeSteps >= 4170) {
      setState(() {
        achievements[8].unlockedAchievement = true;
        achievements[8].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(12);
    }
    //Sprinter: 15 km/h – 30 min – 6.240 Schritte (Zeit)
    if (timeSteps >= 6240) {
      setState(() {
        achievements[9].unlockedAchievement = true;
        achievements[9].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(13);
    }
    //EarlyBird Morgens von 8:00 - 10:00
    if (secondTimeSteps >= 2000) {
      setState(() {
        achievements[14].unlockedAchievement = true;
        achievements[14].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(14);
    }
    //Nachteule von 22:00 - 24:00
    if (secondTimeSteps >= 2000) {
      setState(() {
        achievements[15].unlockedAchievement = true;
        achievements[15].unlockedBox2 = true;
      });
      updateSpecificAchievementInCloud(15);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
      child: Column(
        children: [
          const Text(
            "Achievements",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final achievement = achievements[index];
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 100,
                          height: 200,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Box2(
                                b: 0,
                                h: 0,
                                inhalt: AchievementElement(
                                  unlockedAchievement:
                                      achievement.unlockedAchievement,
                                  imageID: achievement.imageID,
                                  name: achievement.name,
                                  infoText: achievement.infoText,
                                ),
                                unlockedBox2: achievement.unlockedBox2,
                              );
                            },
                          ),
                        ),
                      );
                    },
                    childCount: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
