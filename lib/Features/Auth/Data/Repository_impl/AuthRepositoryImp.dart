import 'package:movies/Features/Auth/Data/Data_Sources/AuthDataSource.dart';
import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';
import 'package:movies/Features/Auth/Domain/Repository/AuthRepository.dart';

class Authrepositoryimp extends Authrepository {
  @override
  final AuthDataSource _AuthDataSource;

  Authrepositoryimp({required AuthDataSource AuthDataSource})
    : _AuthDataSource = AuthDataSource;

  Future<LoginRequestModel> LoginRep(String Email, String password) async {
    // TODO: implement LoginRep
    final Response = await _AuthDataSource.Login(Email, password);
    return Response;
  }

  @override
  Future<void> ResetPasswordRep(
    String OldPassword,
    String NewPassword,
    String Token,
  ) async {
    // TODO: implement ResetPasswordRep
    await _AuthDataSource.ResetPassword(OldPassword, NewPassword, Token);
  }

  @override
  Future<Signupmodel> SignupRep(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  ) async {
    final Response = await _AuthDataSource.Signup(
      Name,
      email,
      password,
      ConfrimPassword,
      Phone,
      AvaterID,
    );
    return Response;
  }
}
