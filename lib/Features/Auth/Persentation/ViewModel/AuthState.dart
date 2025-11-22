// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';

class Authstate {}

class AuthInitState extends Authstate {}

class AuthLoginLoading extends Authstate {}

class AuthLoginSuccess extends Authstate {
  LoginRequestModel response;
  AuthLoginSuccess({required this.response});
}

class AuthLoginError extends Authstate {
  String Error;
  AuthLoginError({required this.Error});
}

class AuthSignupLoading extends Authstate {}

class AuthSignupSuccess extends Authstate {
  Signupmodel response;
  AuthSignupSuccess({required this.response});
}

class AuthSignupError extends Authstate {
  String Error;
  AuthSignupError({required this.Error});
}

class AuthForgetpasswordLoading extends Authstate {}

class AuthForgetpasswordSuccess extends Authstate {}

class AuthForgetpasswordError extends Authstate {
  String Error;
  AuthForgetpasswordError({required this.Error});
}
