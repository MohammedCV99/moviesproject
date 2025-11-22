import 'package:movies/Profile/Data/Models/UserModel.dart';
import 'package:movies/Profile/Domain/Repository/ProfileRepository.dart';

class Getprofileusecase {
  final Profilerepository _profilerepository;

  Getprofileusecase({required Profilerepository profilerepository})
    : _profilerepository = profilerepository;
  Future<ProfileResponse> call(String token) async {
    return await _profilerepository.GetProfileRep(token);
  }
}
