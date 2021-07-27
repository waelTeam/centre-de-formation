import '/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
//start

void main() => runApp(Centre());

class Centre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Login.id, //static we deleted the () of method
      routes: {
        Login.id: (context) => Login (),
        Register.id:(context) =>Register(),


      },
    );
  }
}