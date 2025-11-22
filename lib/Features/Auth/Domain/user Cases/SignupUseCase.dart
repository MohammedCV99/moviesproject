import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';
import 'package:movies/Features/Auth/Domain/Repository/AuthRepository.dart';

class Signupusecase {
  final Authrepository _authrepository;

  Signupusecase({required Authrepository authrepository})
    : _authrepository = authrepository;

  Future<Signupmodel> call(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  ) async {
    return await _authrepository.SignupRep(
      Name,
      email,
      password,
      ConfrimPassword,
      Phone,
      AvaterID,
    );
  }
}
