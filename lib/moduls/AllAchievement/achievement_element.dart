import 'package:flutter/material.dart';

class AchievementElement extends StatelessWidget {
  final bool unlockedAchievement;
  final String imageID;
  final String name;
  final String infoText;

  const AchievementElement(
      {super.key,
      required this.unlockedAchievement,
      required this.imageID,
      required this.name,
      required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (unlockedAchievement)
            Image.asset(
              imageID,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            )
          else
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.black45,
                BlendMode.srcATop,
              ),
              child: Image.asset(
                imageID,
                fit: BoxFit.cover,
                width: 30,
                height: 30,
                color: Colors.black45,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: unlockedAchievement
                  ? const Color.fromARGB(140, 255, 255, 255)
                  : Colors.black45,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            infoText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: unlockedAchievement
                  ? const Color.fromARGB(140, 255, 255, 255)
                  : Colors.black45,
            ),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
