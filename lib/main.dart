
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/main_screen.dart';
import 'util/const.dart';
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
      initialRoute:Login.id, //static we deleted the () of method
      routes: {
        Login.id: (context) => Login (),
        Register.id:(context) =>Register(),
        MainScreen.id:(context) => MainScreen()


      },
    );
  }
}
//