import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/pages_authentification/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "StepperAuth", options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BigSteppa',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 42, 42, 42),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 42, 42, 42),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 42, 42, 42)),
      ),
      home: const AuthPage(),
    );
  }
}
