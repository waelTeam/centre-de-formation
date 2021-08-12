abstract class CentreLoginStates {}

class CentreLoginInitialState extends CentreLoginStates {}

class CentreLoginLoadingState extends CentreLoginStates {}

class CentreLoginSuccessState extends CentreLoginStates
{
  final String uId;

  CentreLoginSuccessState(this.uId);
}

class CentreLoginErrorState extends CentreLoginStates
{
  final String error;

  CentreLoginErrorState(this.error);
}

class CentreChangePasswordVisibilityState extends CentreLoginStates {}
