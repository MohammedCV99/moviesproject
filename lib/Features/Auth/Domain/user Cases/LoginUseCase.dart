import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Domain/Repository/AuthRepository.dart';

class Loginusecase {
  final Authrepository _authrepository;

  Loginusecase({required Authrepository authrepository})
    : _authrepository = authrepository;

  Future<LoginRequestModel> call(String email, String password) async {
    return await _authrepository.LoginRep(email, password);
  }
}
