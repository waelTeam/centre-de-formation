import 'package:centredeformation/screens/modules/centre_formation/centre_login_/cubit/cubit.dart';
import 'package:centredeformation/screens/modules/centre_formation/centre_login_/cubit/states.dart';
import 'package:centredeformation/screens/modules/centre_formation/centre_register--/centre_register_screen.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:centredeformation/screens/layout/centre_app/centre_layout.dart';
// import 'package:centredeformation/screens/modules/social_app/social_login/cubit/cubit.dart';
// import 'package:centredeformation/screens/modules/social_app/social_login/cubit/states.dart';
// import 'package:centredeformation/screens/modules/social_app/social_register/social_register_screen.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/shared/network/local/cache_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../centre_formation/main_screen_layout/main_screen.dart';


class CentreLoginScreen extends StatelessWidget {

  final String assetLogin= 'assets/images/secure_login.svg';
  static const String id='SocialLoginScreen';
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CentreLoginCubit(),
      child: BlocConsumer<CentreLoginCubit, CentreLoginStates>(
        listener: (context, state) {
          if (state is CentreLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is CentreLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                CentreLayout(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                      alignment: Alignment.center,
                     child:Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text(
                            'LOGIN',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
                          ),
                           SvgPicture.asset(
                              assetLogin,
                              semanticsLabel: 'Acme Logo',
                              width: 300,

                            ),


                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: CentreLoginCubit.get(context).suffix,
                            onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                CentreLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isPassword: CentreLoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              CentreLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'password is too short';
                              }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! CentreLoginLoadingState,
                            builder: (context) => defaultButton(
                              function: () {


                                if (formKey.currentState.validate()) {
                                  CentreLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  // navigateTo(
                                  //     context,
                                  //     //MainScreen()
                                  //   CentreLayout()
                                  // );
                                }
                              },
                              text: 'login',
                              isUpperCase: true,
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                              ),
                              defaultTextButton(
                                function: () {
                                  navigateTo(
                                    context,
                                    CentreRegisterScreen(),
                                  );
                                },
                                text: 'register',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
              ),
            ),

          );
        },
      ),
    );
  }
}
