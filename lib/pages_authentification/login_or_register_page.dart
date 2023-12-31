import 'package:flutter/material.dart';
import 'package:big_steppa_philipp_oleg/pages_authentification/login_page.dart';
import 'package:big_steppa_philipp_oleg/pages_authentification/register_page.dart';

//Diese Page sorgt für den Wechsel zwischen Login und Register Page 
class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  //wechsel zwischen Login und Register Page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages,);
    } else {
      return RegisterPage(onTap: togglePages,);
    }
  }
}


