import 'package:flutter/material.dart';
import '/animation/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_screen.dart';
import'../provider/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
//start
class Register extends StatelessWidget {
  static const String id='register_screen';
  final String assetRegister= 'assets/images/sign.svg';
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
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage('assets/images/background.png'),
                  //         fit: BoxFit.fill
                  //     )
                  // ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SvgPicture.asset(
                          assetRegister,
                          semanticsLabel: 'Acme Logo',
                        height: 300,

                        ),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 355),
                          child: Center(
                            child: Text("Register",
                              style: TextStyle(color:Color.fromRGBO(143, 148, 251, 1),
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
                          child: Text("Sign up", style: TextStyle(
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
                        label:Text('Sign up with Google'),
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
                      SizedBox(height: 70,),
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

