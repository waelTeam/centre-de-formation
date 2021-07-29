
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/main_screen.dart';
import 'util/const.dart';
import 'screens/formateur/get_student.dart';
// void main() => runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     )
// );

void main() => runApp(Centre());

class Centre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      initialRoute:WelcomeScreen.id, //static we deleted the () of method
      routes: {
        Login.id: (context) => Login (),
        Register.id:(context) =>Register(),
        MainScreen.id:(context) => MainScreen(),
        WelcomeScreen.id:(context) => WelcomeScreen(),
        AdminHome.id:(context) => AdminHome(),
        GetStudent.id:(context)=>GetStudent()

      },
    );
  }
}
//