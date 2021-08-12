import 'package:centredeformation/screens/modules/centre_formation/centre_login_/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CentreLoginCubit extends Cubit<CentreLoginStates> {
  CentreLoginCubit() : super(CentreLoginInitialState());

  static CentreLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(CentreLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      emit(CentreLoginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(CentreLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(CentreChangePasswordVisibilityState());
  }
}
