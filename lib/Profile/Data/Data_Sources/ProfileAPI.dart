import 'package:movies/Profile/Data/Data_Sources/ProfileDataSources.dart';
import 'package:movies/Profile/Data/Models/UserModel.dart';

class Profileapi extends Profiledatasources {
  @override
  Future<ProfileResponse> DeleteProfile(String token) {
    // TODO: implement DeleteProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileResponse> GetProfile(String token) {
    // TODO: implement GetProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileResponse> UpdateProfile(
    String token,
    String email,
    int avaterId,
  ) {
    // TODO: implement UpdateProfile
    throw UnimplementedError();
  }
}
