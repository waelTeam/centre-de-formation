
import 'package:centredeformation/screens/layout/centre_app/centre_layout.dart';
import 'package:centredeformation/screens/layout/centre_app/cubit/cubit.dart';
import 'package:centredeformation/screens/layout/centre_app/cubit/states.dart';
import 'package:centredeformation/screens/modules/centre_formation/centre_login_/centre_login_screen.dart';
import 'package:centredeformation/screens/modules/centre_formation/centre_register--/centre_register_screen.dart';
import 'package:centredeformation/screens/modules/centre_formation/home_page/HomePage.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:centredeformation/screens/formateur/add_formation.dart';
import 'package:centredeformation/screens/formateur/add_formation_annonce.dart';
import 'package:centredeformation/screens/get_formateur.dart';
//import 'package:centredeformation/screens/modules/social_app/chats/chats_screen.dart';
import 'package:centredeformation/screens/product/products_screen.dart';
import 'package:centredeformation/screens/shared/bloc_observer.dart';
import 'package:centredeformation/screens/shared/components/constants.dart';
import 'package:centredeformation/screens/shared/network/local/cache_helper.dart';
import 'package:centredeformation/screens/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'screens/modules/centre_formation/centre_login/login_screen.dart';
// import 'screens/modules/centre_formation/centre_register/registration_screen.dart';
import 'screens/modules/centre_formation/main_screen_layout/main_screen.dart';
import 'util/const.dart';
import 'screens/formateur/list_students.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  //bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');

  // if(onBoarding != null)
  // {
  //   if(token != null) widget = ShopLayout();
  //   else widget = ShopLoginScreen();
  // } else
  //   {
  //     widget = OnBoardingScreen();
  //   }

  if(uId != null)
  {
    widget = CentreLayout();
  } else
  {
    widget = CentreLoginScreen();
  }

  runApp(MyApp(
    //isDark: isDark,
    startWidget: widget,
  ));
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build
  //final bool isDark;
  final Widget startWidget;

  MyApp({
    //this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => CentreCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<CentreCubit, CentreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // debugShowCheckedModeBanner: false,
            theme: Constants.lightTheme,
            darkTheme: Constants.darkTheme,
            themeMode: ThemeMode.light,
            //themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: WelcomeScreen(),
          );
        },
      ),
    );
  }
}




//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(Centre());
// }
//
// class Centre extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       theme: Constants.lightTheme,
//       darkTheme: Constants.darkTheme,
//       initialRoute: WelcomeScreen.id, //static we deleted the () of method
//       routes: {
//         CentreLoginScreen.id: (context) => CentreLoginScreen(),
//         CentreRegisterScreen.id:(context) =>CentreRegisterScreen(),
//         MainScreen.id:(context) => MainScreen(),
//         WelcomeScreen.id:(context) => WelcomeScreen(),
//         AdminHome.id:(context) => AdminHome(),
//         ListStudents.id:(context)=>ListStudents(),
//         AddAnnonce.id:(context)=>AddAnnonce(),
//         AddFormation.id:(context)=>AddFormation(),
//         HomePage.id:(context)=>HomePage(),
//         // ProfilsFormateur.id:(context)=>ProfilsFormateur(),
//         GetFormateur.id:(context)=>GetFormateur(),
//         ProductsScreen.id:(context)=>ProductsScreen()
//       },
//     );
//   }
// }
