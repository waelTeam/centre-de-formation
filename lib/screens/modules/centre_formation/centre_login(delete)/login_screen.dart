 import 'package:centredeformation/screens/modules/centre_formation/main_screen_layout/main_screen.dart';
import 'package:flutter/material.dart';
 import '/animation/FadeAnimation.dart';
 import'../../../shared/components/rounded_button.dart';
 import'../../../../provider/google_sign_in.dart';
 import'../main_screen_layout/main_screen.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:flutter_svg/flutter_svg.dart';
// //start
class Login extends StatelessWidget {
  static const String id='login_screen';
  final String assetLogin= 'assets/images/secure_login.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                   height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SvgPicture.asset(
                            assetLogin,
                            semanticsLabel: 'Acme Logo',
                          width: 300,

                        ),
                      ),

                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top:350),

                          child: Center(
                            child: Text("Sign in", style:
                            TextStyle(color:Color.fromRGBO(143, 148, 251, 1),
                                fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                onChanged: (value){

                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2, Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                          },
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text("Sign in", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:Colors.white,
                          ),),
                        ),
                        // child: Center(
                        //   child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        // ),
                      )),
                      SizedBox(height: 20,),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary:Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity,50),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google,color:Colors.red),
                        label:Text('Sign in with Google'),
                        onPressed: () async {
//                  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//                  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//                  final GoogleAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
//                  await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Navigator.pushNamed(context,ChatScreen.id));
                          GoogleSignInProvider google = GoogleSignInProvider();

                          var test = await google.googleLogin();
                          //await google.logout();
                          print("le test est :" + test.toString());
                          if(test == null) Navigator.pushNamed(context,MainScreen.id);
                          //await Navigator.pushNamed(context,MainScreen.id);
//              final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
//
//              var t = provider.googleLogin();
//              if (t){
//                Navigator.pushNamed(context,ChatScreen.id);
//              }
                        },
                      ),
                      SizedBox(height: 20,),
                      FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
////