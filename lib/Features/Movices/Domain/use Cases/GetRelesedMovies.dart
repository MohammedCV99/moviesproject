import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';

class Getrelesedmovies {
  final MoviesRepository _MoviesRepository;

  Getrelesedmovies({required MoviesRepository MoviesRepository})
    : _MoviesRepository = MoviesRepository;

  Future<List<Movie>> call() async {
    return await _MoviesRepository.GetRelesedMovies();
  }
}
