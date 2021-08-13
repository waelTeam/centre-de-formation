
import 'package:centredeformation/provider/adminMode.dart';
import 'package:centredeformation/screens/HomePage.dart';
import 'package:centredeformation/screens/details.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:centredeformation/screens/formateur/add_formation.dart';
import 'package:centredeformation/screens/formateur/add_formation_annonce.dart';
import 'package:centredeformation/screens/get_formateur.dart';

import 'package:centredeformation/screens/modules/social_app/chats/chats_screen.dart';
import 'package:centredeformation/screens/product/products_screen.dart';
import 'package:provider/provider.dart';


import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'util/const.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Centre());
}

class Centre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminMode>(
            create: (context)=>AdminMode(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        initialRoute:   AddFormation.id, //static we deleted the () of method
        routes: {
          MainScreen.id:(context) => MainScreen(),
          WelcomeScreen.id:(context) => WelcomeScreen(),
          AdminHome.id:(context) => AdminHome(),
          AddAnnonce.id:(context)=>AddAnnonce(),
          AddFormation.id:(context)=>AddFormation(),
          HomePage.id:(context)=>HomePage(),
          ProfilsFormateur.id:(context)=>ProfilsFormateur(),//
          GetFormateur.id:(context)=>GetFormateur(),//
          ProductsScreen.id:(context)=>ProductsScreen(),
          Details.id:(context)=>Details()

        },
      ),
    );
  }
}
