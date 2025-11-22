import 'package:movies/Profile/Data/Data_Sources/ProfileAPI.dart';
import 'package:movies/Profile/Data/Data_Sources/ProfileDataSources.dart';
import 'package:movies/Profile/Data/RepositryImp/ProfileRepositryImp.dart';
import 'package:movies/Profile/Domain/Repository/ProfileRepository.dart';
import 'package:movies/Profile/Domain/user%20Cases/DeleteProfileUseCase.dart';
import 'package:movies/Profile/Domain/user%20Cases/GetProfileUseCase.dart';
import 'package:movies/Profile/Domain/user%20Cases/UpdateProfileUseCase.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileCubit.dart';

class Profileservicelocater {
  static final Profiledatasources profiledatasources = Profileapi();

  static final Profilerepository profilerepository = Profilerepositryimp(
    profiledatasource: profiledatasources,
  );

  static final Getprofileusecase getprofileusecase = Getprofileusecase(
    profilerepository: profilerepository,
  );

  static final Updateprofileusecase updateprofileusecase = Updateprofileusecase(
    profilerepository: profilerepository,
  );

  static final Deleteprofileusecase deleteprofileusecase = Deleteprofileusecase(
    profilerepository: profilerepository,
  );

  /// 🔥 NEW: this returns a **new cubit instance every time**
  static Profilecubit makeProfileCubit() {
    return Profilecubit(
      getprofileusecase,
      deleteprofileusecase,
      updateprofileusecase,
    );
  }
}
