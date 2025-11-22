import 'package:movies/Features/Auth/Data/Data_Sources/AuthAPI.dart';
import 'package:movies/Features/Auth/Data/Data_Sources/AuthDataSource.dart';
import 'package:movies/Features/Auth/Data/Repository_impl/AuthRepositoryImp.dart';
import 'package:movies/Features/Auth/Domain/Repository/AuthRepository.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/LoginUseCase.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/ResetPasswordUseCase.dart';
import 'package:movies/Features/Auth/Domain/user%20Cases/SignupUseCase.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthCubit.dart';

class Authserviceslocator {
  static AuthDataSource authdatasource = Authapi();
  static Authapi authapi = Authapi();
  static Authrepository authRepository = Authrepositoryimp(
    AuthDataSource: authdatasource,
  );
  static Loginusecase loginusecase = Loginusecase(
    authrepository: authRepository,
  );
  static Signupusecase signupusecase = Signupusecase(
    authrepository: authRepository,
  );
  static Resetpasswordusecase resetpasswordusecase = Resetpasswordusecase(
    authrepository: authRepository,
  );
  static Authcubit authcubit = Authcubit(
    loginusecase,
    signupusecase,
    resetpasswordusecase,
    authapi,
  );
}
