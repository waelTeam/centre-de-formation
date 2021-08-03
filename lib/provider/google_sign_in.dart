import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import'package:flutter/material.dart' ;
import'../screens/main_screen.dart';
class GoogleSignInProvider extends ChangeNotifier {

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount  _user ;
  GoogleSignInAccount get user =>_user ;

  Future<dynamic> googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return 0 ;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential((credential));

      //notifyListeners();
      return 1;
    }catch(e) {
      print(e.toString());
    }
  }
  Future logout()async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}