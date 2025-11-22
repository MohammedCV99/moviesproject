import 'package:movies/Profile/Data/Models/UserModel.dart';

abstract class Profilestate {}

class ProfileinitState extends Profilestate {}

class GetProfileLoadingState extends Profilestate {}

class GetProfileSuccessState extends Profilestate {
  final ProfileResponse response;

  GetProfileSuccessState(this.response);
}

class GetProfileErrorState extends Profilestate {
  final String Error;

  GetProfileErrorState(this.Error);
}

class updateProfileLoadingState extends Profilestate {}

class updateProfileSuccessState extends Profilestate {}

class updateProfileErrorState extends Profilestate {
  final String Error;

  updateProfileErrorState(this.Error);
}

class deleteProfileLoadingState extends Profilestate {}

class deleteProfileSuccessState extends Profilestate {}

class deleteProfileErrorState extends Profilestate {
  final String Error;

  deleteProfileErrorState(this.Error);
}
