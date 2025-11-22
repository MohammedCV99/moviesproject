import 'package:movies/Profile/Data/Models/UserModel.dart';

abstract class Profilerepository {
  Future<ProfileResponse> GetProfileRep(String token);
  Future<void> UpdateProfileRep(String token, String email, int avaterId);
  Future<void> DeleteProfileRep(String token);
}
