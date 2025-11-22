import 'package:movies/Profile/Domain/Repository/ProfileRepository.dart';

class Updateprofileusecase {
  final Profilerepository _profilerepository;

  Updateprofileusecase({required Profilerepository profilerepository})
    : _profilerepository = profilerepository;
  Future<void> call(String token, String Email, int AvaterID) async {
    return await _profilerepository.UpdateProfileRep(token, Email, AvaterID);
  }
}
