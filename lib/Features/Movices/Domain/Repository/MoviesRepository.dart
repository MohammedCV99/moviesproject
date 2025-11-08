import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class MoviesRepository {
  Future<List<Movie>> GetMoviesByCategories(String MoviesListName);
  Future<List<Movie>> GetMoviesBySuggestion(int MovieID);
  Future<MovieDetials> GetMovieDetials(int MovieID);
}
