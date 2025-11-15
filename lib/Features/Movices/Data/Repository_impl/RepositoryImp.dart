import 'package:movies/Features/Movices/Data/Data_Sources/MoviesDataSource.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';

class MoviesRepositoryImp extends MoviesRepository {
  final Moviesdatasource _MovieDataSource;

  MoviesRepositoryImp({required Moviesdatasource MovieDataSource})
    : _MovieDataSource = MovieDataSource;
  @override
  Future<List<Movie>> GetMoviesByCategories(String moviesListName) async {
    try {
      Moviesmodel response = await _MovieDataSource.GetMoviesByCategory(
        moviesListName,
      );
      return response.data.movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  @override
  Future<List<Movie>> GetMoviesBySuggestion(int MovieID) async {
    // TODO: implement GetMoviesBySuggestion
    try {
      Moviesmodel response = await _MovieDataSource.GetMoviesBySugestion(
        MovieID,
      );
      return response.data.movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  @override
  Future<MovieDetials> GetMovieDetials(int MovieID) async {
    // TODO: implement GetMoviesBySuggestion
    try {
      MovieDetaialsResponse response = await _MovieDataSource.GetMovieDetials(
        MovieID,
      );
      return response.data.movie;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  @override
  Future<List<Movie>> GetRelesedMovies() async {
    // TODO: implement GetRelesedMovies
    try {
      Moviesmodel response = await _MovieDataSource.GetRelesedMovies();

      return response.data.movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
