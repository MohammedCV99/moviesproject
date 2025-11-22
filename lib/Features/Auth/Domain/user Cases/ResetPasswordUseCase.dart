import 'package:movies/Features/Auth/Domain/Repository/AuthRepository.dart';

class Resetpasswordusecase {
  final Authrepository _authrepository;

  Resetpasswordusecase({required Authrepository authrepository})
    : _authrepository = authrepository;

  Future<void> call(
    String OldPassword,
    String NewPassword,
    String Token,
  ) async {
    return await _authrepository.ResetPasswordRep(
      OldPassword,
      NewPassword,
      Token,
    );
  }
}
