import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class Moviesdatasource {
  Future<Moviesmodel> GetMoviesByCategory(String genere);
  Future<Moviesmodel> GetMoviesBySugestion(int MovieID);
  Future<MovieDetaialsResponse> GetMovieDetials(int MovieID);
  Future<Moviesmodel> GetRelesedMovies();
}
