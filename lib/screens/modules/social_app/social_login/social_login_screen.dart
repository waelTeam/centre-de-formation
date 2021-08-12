import 'package:centredeformation/provider/adminMode.dart';
import 'package:centredeformation/screens/formateur/AdminHome.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:centredeformation/screens/layout/social_app/social_layout.dart';
import 'package:centredeformation/screens/modules/social_app/social_login/cubit/cubit.dart';
import 'package:centredeformation/screens/modules/social_app/social_login/cubit/states.dart';
import 'package:centredeformation/screens/modules/social_app/social_register/social_register_screen.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/shared/network/local/cache_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../main_screen.dart';

class SocialLoginScreen extends StatelessWidget {
  final String assetLogin = 'assets/images/secure_login.svg';
  static const String id = 'SocialLoginScreen';
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isAdmin = false;
  final adminPassword = 'formateur123456';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                SocialLayout(),
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LOGIN',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.black),

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
                            suffix: SocialLoginCubit.get(context).suffix,
                            onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isPassword:
                                SocialLoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              SocialLoginCubit.get(context)
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
                            condition: state is! SocialLoginLoadingState,
                            builder: (context) => defaultButton(
                              function: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
                                    if (passwordController.text == adminPassword) {
                                      try {
                                       await SocialLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                        Navigator.pushNamed(context, AdminHome.id);
                                      }
                                      catch (e) {
                                        print(e.message);
                                      }
                                    }
                                  }
                                    else {
                                      try {
                                       await SocialLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                        Navigator.pushNamed(context, MainScreen.id);
                                      }
                                    catch(e) {
                                        print(e.message);
                                    }
                                }

                                }
                              },
                              // {
                              //   if (formKey.currentState.validate()) {
                              //     SocialLoginCubit.get(context).userLogin(
                              //       email: emailController.text,
                              //       password: passwordController.text,
                              //     );
                              //     navigateTo(context, MainScreen());
                              //   }
                              // },
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
                                    SocialRegisterScreen(),
                                  );
                                },
                                text: 'register',
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Provider.of<AdminMode>(context,
                                            listen: false)
                                        .changeIsAdmin(true);
                                  },
                                  child: Text(
                                    'I\'m a trainer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Provider.of<AdminMode>(context)
                                                .isAdmin
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    Provider.of<AdminMode>(context,
                                            listen: false)
                                        .changeIsAdmin(false);
                                  },
                                  child: Text(
                                    'I\'m a student',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Provider.of<AdminMode>(context)
                                                .isAdmin
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                )),
                              ],
                            ),
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
