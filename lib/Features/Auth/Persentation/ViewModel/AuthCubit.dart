import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/BodyAssets.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Auth/Data/Data_Sources/AuthAPI.dart';
import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/LoginUseCase.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/ResetPasswordUseCase.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/SignupUseCase.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthState.dart';

class Authcubit extends Cubit<Authstate> {
  final Loginusecase loginusecase;
  final Signupusecase signupusecase;
  final Resetpasswordusecase resetpasswordusecase;
  final Authapi authapi;

  Authcubit(
    this.loginusecase,
    this.signupusecase,
    this.resetpasswordusecase,
    this.authapi,
  ) : super(AuthInitState()) {}
  LoginRequestModel? Loginresponse;
  Signupmodel? SignupResponse;
  Future<void> Login(String email, String password) async {
    emit(AuthLoginLoading());
    try {
      Loginresponse = await loginusecase.call(email, password);
      emit(AuthLoginSuccess(response: Loginresponse!));
    } catch (e) {
      print("################################");
      print(e.toString());
      emit(AuthLoginError(Error: e.toString()));
    }
  }

  Future<void> Signup(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  ) async {
    emit(AuthSignupLoading());
    try {
      SignupResponse = await signupusecase.call(
        Name,
        email,
        password,
        ConfrimPassword,
        Phone,
        AvaterID,
      );
      print("Cubit: Got response!");
      emit(AuthSignupSuccess(response: SignupResponse!));
    } catch (e) {
      print("################################");
      print(e.toString());
      emit(AuthSignupError(Error: e.toString()));
    }
  }

  Future<void> ResetPassword(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    Dio dio = Dio();
    emit(AuthForgetpasswordLoading());
    try {
      final loginResponse = await loginusecase.call(email, oldPassword);
      final token = loginResponse.data;
      print("######### LOGIN TOKEN:${token} ##############");

      await resetpasswordusecase.call(oldPassword, newPassword, token);
      emit(AuthForgetpasswordSuccess());
    } catch (e) {
      print("############ " + e.toString() + " ##############");
      emit(AuthForgetpasswordError(Error: e.toString()));
    }
  }
}
