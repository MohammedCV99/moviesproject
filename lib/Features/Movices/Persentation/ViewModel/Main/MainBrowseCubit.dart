import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/GetMovieByCategory.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/GetRelesedMovies.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseState.dart';

class MainMoviesCubit extends Cubit<MainMoviesState> {
  final GetMoviesByCategorieUsecase getMoviesByCategorieUsecase;
  final GetMovieDetials getMovieDetials;
  final Getrelesedmovies _getrelesedmovies;

  MainMoviesCubit(
    this.getMoviesByCategorieUsecase,
    this.getMovieDetials,
    this._getrelesedmovies,
  ) : super(MainMoviesInitState()) {}
  List<Movie> repsonse = [];
  late MovieDetials DetialsResponse;
  Future<void> getMoviesByCategorieUsecaseMethod(String catName) async {
    try {
      emit(MainMoviesLoadingState());
      repsonse = await getMoviesByCategorieUsecase(catName);
      emit(MainMoviesSuccessState(sources: repsonse));
    } catch (e) {
      emit(MainMoviesErrorstate(Error: e.toString()));
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

  List<Movie> relesedrepsonse = [];
  Future<void> GetrelesedmoviesUseCase(String MovieCat) async {
    try {
      emit(RelesedMoviesLoadingState());

      relesedrepsonse = await _getrelesedmovies();
      repsonse = await getMoviesByCategorieUsecase(MovieCat);
      emit(
        RelesedMoviesSuccessState(
          releasedMovies: relesedrepsonse,
          RecommededMovies: repsonse,
        ),
      );
    } catch (e) {
      emit(RelesedMoviesErrorstate(Error: e.toString()));
    }
  }
}
