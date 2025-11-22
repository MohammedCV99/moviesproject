import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Profile/Data/Models/UserModel.dart';
import 'package:movies/Profile/Domain/user%20Cases/DeleteProfileUseCase.dart';
import 'package:movies/Profile/Domain/user%20Cases/GetProfileUseCase.dart';
import 'package:movies/Profile/Domain/user%20Cases/UpdateProfileUseCase.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileState.dart';

class Profilecubit extends Cubit<Profilestate> {
  Profilecubit(
    this.getprofileusecase,
    this.deleteprofileusecase,
    this.updateprofileusecase,
  ) : super(ProfileinitState()) {}
  final Getprofileusecase getprofileusecase;
  final Deleteprofileusecase deleteprofileusecase;
  final Updateprofileusecase updateprofileusecase;
  ProfileResponse? response;
  Future<void> GetProfile(String token) async {
    emit(GetProfileLoadingState());
    try {
      response = await getprofileusecase.call(token);
      emit(GetProfileSuccessState(response!));
    } catch (e) {
      print("################################");
      print(e.toString());
      emit(GetProfileErrorState(e.toString()));
    }
  }

  Future<void> deleteProfile(String token) async {
    emit(deleteProfileLoadingState());
    try {
      await deleteprofileusecase.call(token);
      emit(deleteProfileSuccessState());
    } catch (e) {
      print("################################");
      print(e.toString());
      emit(deleteProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile(String token, String Email, int AveterID) async {
    emit(updateProfileLoadingState());
    try {
      await updateprofileusecase.call(token, Email, AveterID);
      emit(updateProfileSuccessState());
    } catch (e) {
      print("################################");
      print(e.toString());
      emit(updateProfileErrorState(e.toString()));
    }
  }
}
