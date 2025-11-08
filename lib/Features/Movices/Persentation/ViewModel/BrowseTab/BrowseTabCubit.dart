import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/user%20Cases/GetMovieByCategory.dart';
import 'package:movies/Features/Movices/Domain/user%20Cases/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabState.dart';

class BrowseTabCubit extends Cubit<BrowseTabState> {
  final GetMoviesByCategorieUsecase getMoviesByCategorieUsecase;
  final GetMovieDetials getMovieDetials;
  BrowseTabCubit(this.getMoviesByCategorieUsecase, this.getMovieDetials)
    : super(BrowseTabInitState()) {}
  List<Movie> repsonse = [];
  late MovieDetials DetialsResponse;
  Future<void> getMoviesByCategorieUsecaseMethod(String catName) async {
    try {
      emit(BrowseTabLoadingState());
      repsonse = await getMoviesByCategorieUsecase(catName);
      emit(BrowseTabSuccessState(sources: repsonse));
    } catch (e) {
      emit(BrowseTabErrorstate(Error: e.toString()));
    }
  }

  Future<void> getMovieDetial(int MovieID) async {
    try {
      emit(DetialsLoadingState());
      DetialsResponse = await getMovieDetials(MovieID);
      emit(DetialsSuccessState(detials: DetialsResponse));
    } catch (e) {
      emit(DetialsErrorstate(Error: e.toString()));
    }
  }
}
