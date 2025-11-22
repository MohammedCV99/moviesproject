import 'package:movies/Profile/Data/Data_Sources/ProfileDataSources.dart';
import 'package:movies/Profile/Data/Models/UserModel.dart';
import 'package:movies/Profile/Domain/Repository/ProfileRepository.dart';

class Profilerepositryimp extends Profilerepository {
  @override
  final Profiledatasources profiledatasources;

  Profilerepositryimp({required Profiledatasources profiledatasource})
    : profiledatasources = profiledatasource;
  Future<void> DeleteProfileRep(String token) async {
    // TODO: implement DeleteProfileRep
    await profiledatasources.DeleteProfile(token);
  }

  @override
  Future<ProfileResponse> GetProfileRep(String token) async {
    // TODO: implement GetProfileRep
    return await profiledatasources.GetProfile(token);
  }

  @override
  Future<void> UpdateProfileRep(
    String token,
    String email,
    int avaterId,
  ) async {
    await profiledatasources.UpdateProfile(token, email, avaterId);
  }
}
