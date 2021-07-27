import '/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';


void main() => runApp(Centre());

class Centre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:WelcomeScreen.id, //static we deleted the () of method
      routes: {
        WelcomeScreen.id:(context) =>WelcomeScreen(),
        Login.id: (context) => Login (),
        Register.id:(context) =>Register(),


      },
    );
  }
}