
import 'package:centredeformation/screens/HomePage.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:centredeformation/screens/formateur/add_formation.dart';
import 'package:centredeformation/screens/formateur/add_formation_annonce.dart';
import 'package:centredeformation/screens/get_formateur.dart';
import 'package:centredeformation/screens/modules/social_app/chats/chats_screen.dart';


import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/main_screen.dart';
import 'util/const.dart';
import 'screens/formateur/list_students.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Centre());
}

class Centre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      initialRoute: getProfile.id, //static we deleted the () of method
      routes: {
        Login.id: (context) => Login (),
        Register.id:(context) =>Register(),
        MainScreen.id:(context) => MainScreen(),
        WelcomeScreen.id:(context) => WelcomeScreen(),
        AdminHome.id:(context) => AdminHome(),
        ListStudents.id:(context)=>ListStudents(),
        AddAnnonce.id:(context)=>AddAnnonce(),
        AddFormation.id:(context)=>AddFormation(),
        HomePage.id:(context)=>HomePage(),
        ProfilsFormateur.id:(context)=>ProfilsFormateur(),
        getProfile.id:(context)=>getProfile(),

      },
    );
  }
}
