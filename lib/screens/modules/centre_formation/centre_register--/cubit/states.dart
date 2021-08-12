abstract class CentreRegisterStates {}

class CentreRegisterInitialState extends CentreRegisterStates {}

class CentreRegisterLoadingState extends CentreRegisterStates {}

class CentreRegisterSuccessState extends CentreRegisterStates {}

class CentreRegisterErrorState extends CentreRegisterStates
{
  final String error;

  CentreRegisterErrorState(this.error);
}

class CentreCreateUserSuccessState extends CentreRegisterStates {}

class CentreCreateUserErrorState extends CentreRegisterStates
{
  final String error;

  CentreCreateUserErrorState(this.error);
}

class CentreRegisterChangePasswordVisibilityState extends CentreRegisterStates {}
