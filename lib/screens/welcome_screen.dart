import 'package:centredeformation/animation/FadeAnimation.dart';
import 'package:centredeformation/screens/modules/social_app/social_register/social_register_screen.dart';
import 'package:flutter/material.dart';

import 'modules/social_app/social_login/social_login_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  final String assetName = 'assets/images/education.svg';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//
class _WelcomeScreenState extends State<WelcomeScreen> {
  final String assetName = 'assets/images/education.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          fontSize: 40,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "to our training center to improve your capability, capacity, productivity and performance.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[900], fontSize: 16),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SvgPicture.asset(
                  assetName,
                  semanticsLabel: 'Acme Logo',
                  width: double.infinity,
                ),
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SocialLoginScreen()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SocialRegisterScreen()));
                          },
                          color: Color.fromRGBO(143, 148, 251, 1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
