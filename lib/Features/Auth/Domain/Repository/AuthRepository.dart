import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';

abstract class Authrepository {
  Future<Signupmodel> SignupRep(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  );
  Future<void> ResetPasswordRep(
    String OldPassword,
    String NewPassword,
    String Token,
  );
  Future<LoginRequestModel> LoginRep(String Email, String password);
}
