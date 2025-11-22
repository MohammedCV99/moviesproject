import 'package:movies/Profile/Data/Models/UserModel.dart';

abstract class Profiledatasources {
  Future<ProfileResponse> GetProfile(String token);
  Future<ProfileResponse> UpdateProfile(
    String token,
    String email,
    int avaterId,
  );
  Future<void> DeleteProfile(String token);
}
