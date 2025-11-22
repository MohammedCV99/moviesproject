import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';

abstract class AuthDataSource {
  Future<LoginRequestModel> Login(String Email, String password);
  Future<Signupmodel> Signup(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  );
  Future<void> ResetPassword(
    String OldPassword,
    String NewPassword,
    String Token,
  );
}
