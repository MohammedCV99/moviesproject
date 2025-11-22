import 'package:movies/Profile/Domain/Repository/ProfileRepository.dart';

class Deleteprofileusecase {
  final Profilerepository _profilerepository;

  Deleteprofileusecase({required Profilerepository profilerepository})
    : _profilerepository = profilerepository;
  Future<void> call(String token) async {
    return await _profilerepository.DeleteProfileRep(token);
  }
}
